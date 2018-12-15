package com.blue.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blue.configuration.BlueEmail;
import com.blue.configuration.Encryptor;
import com.blue.configuration.MyResponse;
import com.blue.model.Album;
import com.blue.model.Artist;
import com.blue.model.PlayHistory;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;
import com.blue.service.UserService;
import com.google.gson.Gson;

@Controller
public class LoginController {
	
	@Autowired
	UserService service;
	@Autowired
	Encryptor encryptor;
	@Autowired
	MyResponse myResponse;
	@Autowired
    Environment environment;
	@Autowired
	BlueEmail blueEmail;
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	@ResponseBody
    public void signUp(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("nickname") String nickname,
    			@RequestParam("email") String email,
    			@RequestParam("password") String password,
    			@RequestParam("firstname") String firstname,
    			@RequestParam("lastname") String lastname) throws Exception {
        password = encryptor.encrypt(password);
		User user = new User(nickname, email, password, firstname, lastname, 
				environment.getRequiredProperty("accountType.general"));
		String v = RandomStringUtils.randomAlphanumeric(30);
		String vCode = Base64.getEncoder().encodeToString(v.getBytes());
		user.setVerificationCode(vCode);
		user.setBan("BAN");
		user.setPrivacy(0);
		JSONObject json = service.register(user);
		if((boolean)json.get("status")) {
			String targetPath = myResponse.getRootPath()
					+ environment.getRequiredProperty("path.userFiles") 
					+ email;
			File outputfile = new File(targetPath);
			if(!outputfile.exists()) outputfile.mkdirs();
			json.put("value", environment.getRequiredProperty("promote.activateAccount"));
			String activateLink = "http://localhost:8080/Blue/activateAccount?name="+nickname+"&vCode="+vCode;
			blueEmail.setEmail("Blue-Activation", email, activateLink);
			Runnable myRunnable = new Runnable(){
			     public void run(){
			    	 	blueEmail.send();
			        Thread.currentThread().interrupt();
			        return;
			     }
			   };
			Thread thread = new Thread(myRunnable);
			thread.start();
		}
		json.put("action", "signUp");
		myResponse.print(response, json);
	}
	
	@RequestMapping(value = "/activateAccount", method = {RequestMethod.GET, RequestMethod.POST})  
    public String activateAccount(
    			HttpServletRequest request,
    			HttpServletResponse res,
    			@RequestParam("name") String name,
    			@RequestParam("vCode") String vCode) throws Exception {
		System.out.println("here");
		User u = service.findFriendByNickName(name);
		System.out.println(u.getStatus());
		if(u.getStatus()!=null&&u.getStatus()==1) {
			return "invalidLink";
		}
		if(u.getVerificationCode().equals(vCode)) {
			System.out.println(vCode);
			u.setStatus(1);
			service.updateUser(u);
		}
		return "AccountActivation";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)  
	@ResponseBody
    public void login(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("username") String email,
    			@RequestParam("password") String password
    			) throws Exception {  
        JSONObject json = new JSONObject();
		json.put("action", "login");
		json.put("status", false);
		json.put("value", environment.getRequiredProperty("message.serviceDown"));
        password = encryptor.encrypt(password);
		User user = null;
		try {
			user = service.verifyLogin(email, password);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			myResponse.print(response, json);
			return;
		}
		
		if (user == null) {
			json.put("value", environment.getRequiredProperty("message.invalidPassword"));  
		}else {
			
			if(user.getStatus()==null||user.getStatus()!=1) {
				json.put("value", environment.getRequiredProperty("message.activationRequired"));  
				myResponse.print(response, json);
				return;
			}
			
			if(!(user.getBan()==null||user.getBan().equals("BAN"))) {
				json.put("value", "This account has been banned!");  
				myResponse.print(response, json);
				return;
			}
			request.getSession().setAttribute("user", user);
				
			List<PlayHistory> playHistoryList = (List<PlayHistory>) user.getPlayHistoryCollection();
			List<String> dates=new ArrayList();
			int index=0;
			for(PlayHistory p: user.getPlayHistoryCollection() ) {
				dates.add(index, p.getDate().toString());
			    index++;
			}

			List<Song> songs = service.getSongs(50);
			request.getSession().setAttribute("publicSongs", songs);
			
			   System.out.println("get albums");
			request.getSession().setAttribute("playHistoryList", dates);
			List<Album> albums = service.getAlbums(20);
			request.getSession().setAttribute("mainAlbums", albums);
			List<Artist> artists = service.getArtists(16);
			request.getSession().setAttribute("popularArtists", artists);
			 

			
			
			
			 System.out.println("get done");
			json.put("status", true);
			json.put("value", request.getContextPath() + "/loadUserPage");  
		}
		myResponse.print(response, json);
	}
	
	
	@RequestMapping(value = "/changePassword", method =  RequestMethod.POST)
	@ResponseBody
	void changePassword(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword
			) throws IOException, NoSuchAlgorithmException {
		User user = (User) request.getSession().getAttribute("user");
		oldPassword = encryptor.encrypt(oldPassword);
		JSONObject res = new JSONObject();
		res.put("action", "changePassword");
		res.put("status", false);
		if (user.getPassword().equals(oldPassword)) {
			newPassword = encryptor.encrypt(newPassword);
			try {
				service.updatePassword(user.getId(), newPassword);
				user.setPassword(newPassword);
				res.put("status", true);
				String msg = "your password has been changed";
				blueEmail.setEmail("Blue-Activation", user.getEmail(), msg);
				Runnable myRunnable = new Runnable(){
				     public void run(){
				    	 	blueEmail.send();
				        Thread.currentThread().interrupt();
				        return;
				     }
				   };
				Thread thread = new Thread(myRunnable);
				thread.start();
			} catch (Exception e) {
				
				System.out.println(e.getMessage());
			}
		}
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/resetPassword", method =  RequestMethod.POST)
	@ResponseBody
	void resetPassword(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("email") String email
			) throws IOException, NoSuchAlgorithmException {
		User user=null;
		try {
			user = service.findUserByEmail(email);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		JSONObject res = new JSONObject();
		res.put("action", "resetPassword");
		res.put("status", false);
		res.put("value", "The account doesn't exist!");
		if (user==null) {
			myResponse.print(response, res);
			return;
		}
		
		try {
			String v = RandomStringUtils.randomAlphanumeric(30);
			String vCode = Base64.getEncoder().encodeToString(v.getBytes());
			String resetLink = "http://localhost:8080/Blue/resetPW?id="+user.getId()+"&vCode="+vCode;
			user.setVerificationCode(vCode);
			user.setVerificationStatus(1);
			Calendar cal = Calendar.getInstance();
			java.util.Date dt = new java.util.Date();
			cal.setTime(dt);
			cal.add(Calendar.MINUTE, 10);
			java.text.SimpleDateFormat sdf =  new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			user.setVerificationDate(cal.getTime());
			service.updateUser(user);
			blueEmail.setEmail("Blue-ResetPassword", email, resetLink);
			Runnable myRunnable = new Runnable(){
			     public void run(){
			    	 	blueEmail.send();
			        Thread.currentThread().interrupt();
			        return;
			     }
			   };
			Thread thread = new Thread(myRunnable);
			thread.start();
			res.put("status", true);
			res.put("value", "Reset link has been sent to your email.");
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
		}
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/resetPW", method = {RequestMethod.GET, RequestMethod.POST})  
    public String resetPW(
    			HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("id") int id,
    			@RequestParam("vCode") String vCode) throws Exception {
		User u = service.findById(id);
		JSONObject res = new JSONObject();
		res.put("action", "resetPW");
		res.put("status", false);
		if(u==null) {
			res.put("value", "Account doesn't exist");
			return "invalidLink";
		}
		if(u.getVerificationStatus()==null||u.getVerificationStatus()!=1) {
			res.put("value", "Invalid link!");
			return "invalidLink";
		}
		
		res.put("status", true);
		request.getSession().setAttribute("resetPWId", id);
		return "resetPassword";
	}
	
	
	@RequestMapping(value = "/processResetPW", method = {RequestMethod.GET, RequestMethod.POST})  
    public void processResetPW(
    			HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("id") int id,
    			@RequestParam("newPassword") String newPassword) throws Exception {
		JSONObject res = new JSONObject();
		res.put("action", "processResetPW");
		res.put("status", false);
		
		User user = service.findById(id);
		if(user==null) {
			res.put("value", environment.getRequiredProperty("message.serviceDown"));
			return;
		}
		newPassword = encryptor.encrypt(newPassword);
		user.setPassword(newPassword);
		user.setVerificationStatus(0);
		service.updateUser(user);
		res.put("status", true);
		try {

			String msg = "your pw has been changed";
			blueEmail.setEmail("Blue-Password", user.getEmail(), msg);
			Runnable myRunnable = new Runnable(){
			     public void run(){
			    	 	blueEmail.send();
			        Thread.currentThread().interrupt();
			        return;
			     }
			   };
			Thread thread = new Thread(myRunnable);
			thread.start();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		myResponse.print(response, res);
	}
	
	
	
	@RequestMapping(value = "/deleteAccount", method = {RequestMethod.GET, RequestMethod.POST})  
    public String deleteAccount(HttpServletRequest request,
    			HttpServletResponse res) throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		if (user == null) {
			return "index";
		}
		service.deleteUserByEmail(user.getEmail());
		request.getSession().invalidate();
		return "index";
	}
	
	
	@RequestMapping(value = "/loadUserPage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ModelAndView show(HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		if (user == null) {
			return new ModelAndView("index");
		}
		return new ModelAndView("main");
	}
	
	
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})  
    public String logout(HttpServletRequest request,
    			HttpServletResponse res) {
		User user = (User)request.getSession().getAttribute("user");
		if (user == null) {
			return "index";
		}
		try {
			service.updateUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().invalidate();
		return "index";
	}
	
	
	protected void print(Object c) {
		System.out.println(c);
	}
}
