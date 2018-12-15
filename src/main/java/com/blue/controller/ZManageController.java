package com.blue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blue.configuration.BlueEmail;
import com.blue.configuration.Encryptor;
import com.blue.configuration.MyResponse;
import com.blue.model.Chinese;
import com.blue.model.English;
import com.blue.model.PaymentHistory;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.Subscriptionfee;
import com.blue.model.User;
import com.blue.service.UserService;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;


@Controller
public class ZManageController {
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
	@Autowired
	English en;
	@Autowired
	Chinese cn;
	
	
	public ZManageController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/loadFriendPlaylist", method={RequestMethod.GET, RequestMethod.POST})
	 @ResponseBody
	 void loadFriendPlaylist(HttpServletRequest request,
	   HttpServletResponse response,
	   @RequestParam("id") int id) throws Exception {
	  Playlist pl = (Playlist) service.find(Playlist.class, id);
	  request.getSession().setAttribute("currentPlaylist", pl);
	  JSONObject res = new JSONObject();
	  res.put("value", "friendPlaylist");
	  myResponse.print(response, res);
	 }
	 
	 @RequestMapping(value = "/friendPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	    public String friendPlaylist() {
	  return "playlist";
	    }
	
	
	@RequestMapping(value = "/preferences", method = {RequestMethod.GET, RequestMethod.POST})
    public String preferences() throws Exception{
		return "preferences";
	}
	
	
	@RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.POST})
	    public String afterA(HttpServletRequest request) throws Exception{
		myResponse.setRootPath(request.getServletContext().getRealPath("/"));
			return "index";
	}
	
	@RequestMapping(value = "/manageAccount", method = RequestMethod.GET)
    public String manageAccount(HttpServletRequest request,
    			HttpServletResponse response) {
		List<User> accounts = null;
		JSONObject res = new JSONObject();
		System.out.println("asdf");
		res.put("action", "manageAccount");
		res.put("status", false);
		try {
			accounts = service.getAccounts();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.put("value", "Unable to connect to DB");
		}
		if(accounts.size()==0) {
			res.put("value", "no account");
		}
		request.getSession().setAttribute("accounts", accounts);
		System.out.println("Asdf");
		return "adminManageAcc";
	}
	
	@RequestMapping(value = "/adminDeleteAccount", method = RequestMethod.POST)
	@ResponseBody
    public void deleteAccount(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("email") String email) throws Exception{
		JSONObject res = new JSONObject();
		res.put("action", "adminDeleteAccount");
		res.put("status", false);
		try {
			service.deleteUserByEmail(email);
			res.put("status", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.put("value", "fail to connect to db");
		}
		res.put("value", email);
		List<User> accounts = service.getAccounts();
		request.getSession().setAttribute("accounts", accounts);
		myResponse.print(response, res);
		System.out.println(email);
	}
	
	
	@RequestMapping(value = "/setPlaylistPrivacy", method = RequestMethod.POST)
	@ResponseBody
    public void setPlaylistPrivacy(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("name") String name,
    			@RequestParam("status") String privacy) throws Exception{
		System.out.println("saf");
		System.out.println(name +"--" +privacy);
		JSONObject res = new JSONObject();
		res.put("action", "setPlaylistPrivacy");
		res.put("status", false);
		User user = (User) request.getSession().getAttribute("user");
		Playlist pl = user.findPlaylistByName(name);
		if(privacy.equals("public")) {
			pl.setPublicStatus(1);
		}else {
			pl.setPublicStatus(0);
		}
		service.updateUser(user);
		res.put("status", true);
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/setPrivacy", method = RequestMethod.POST)
	@ResponseBody
    public void setPrivacy(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("status") String status) throws Exception{
		JSONObject res = new JSONObject();
		res.put("action", "setPrivacy");
		res.put("status", false);
		System.out.println(status);
		User user = (User) request.getSession().getAttribute("user");
		if(status.equals("public")) {
			user.setPrivacy(1);
		}else {
			user.setPrivacy(0);
		}
		service.updateUser(user);
		res.put("status", true);
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	@ResponseBody
    public void editProfile(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("firstname") String firstname,
    			@RequestParam("lastname") String lastname,
    			@RequestParam("nickname") String nickname) throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		JSONObject res = new JSONObject();
		res.put("action", "editProfile");
		res.put("status", false);
		res.put("value", "Nickname exist!");
		try {
			int i = service.findUserByNickname(nickname);
			if(i==-1) {
				user.setNickname(nickname);
				user.setFirstname(firstname);
				user.setLastname(lastname);
				service.updateUser(user);
				request.getSession().setAttribute("user", user);
				res.put("status", true);
				res.put("value", nickname);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.put("value", "fail to connect to db");
		}
		myResponse.print(response, res);
	}
	
	
	
	@RequestMapping(value = "/adminAddAccount", method = {RequestMethod.GET, RequestMethod.POST})
    public String adminAddAccount() throws Exception{
		return "AdminAddAcc";
	}
	
	
	@RequestMapping(value = "/addAccount", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void signUp(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("nickname") String nickname,
    			@RequestParam("email") String email,
    			@RequestParam("password") String password,
    			@RequestParam("firstname") String firstname,
    			@RequestParam("lastname") String lastname,
    			@RequestParam("type") String type) throws Exception {
        password = encryptor.encrypt(password);
		User user = new User(nickname, email, password, firstname, lastname, type);
		user.setBan("BAN");
		user.setPrivacy(0);
		user.setStatus(1);
		JSONObject json = service.register(user);
		if((boolean)json.get("status")) {
			String targetPath = myResponse.getRootPath()
					+ environment.getRequiredProperty("path.userFiles") 
					+ email;
			File outputfile = new File(targetPath);
			if(!outputfile.exists()) outputfile.mkdirs();
		}
		json.put("action", "addAccount");
		myResponse.print(response, json);
	}
	
	
	@RequestMapping(value = "/monthlyPaymentHistory", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void monthlyPaymentHistory(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("month") String month,
    			@RequestParam("year") String year) throws Exception {
		JSONObject res = new JSONObject();
		res.put("action", "monthlyPaymentHistory");
		res.put("status", false);
		User user = (User) request.getSession().getAttribute("user");
		List<Object> h = service.findPaymentHistory(user.getId(), month, year);
		System.out.println(h.size());
		if(h.size()==0) {
			res.put("value", "No payment history in the month!");
		}else {
			res.put("status", true);
			request.getSession().setAttribute("monthlyPayment", h);
		}
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/allPaymentHistory", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void allPaymentHistory(HttpServletRequest request,
    			HttpServletResponse response) throws Exception {
		JSONObject res = new JSONObject();
		res.put("action", "monthlyPaymentHistory");
		res.put("status", false);
		User user = (User) request.getSession().getAttribute("user");
		List<Object> h = service.findAllPaymentHistory(user.getId());
		if(h.size()==0) {
			res.put("value", "No result available!");
		}else {
			res.put("status", true);
			request.getSession().setAttribute("monthlyPayment", h);
		}
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/adminBanAccount", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void adminBanAccount(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("email") String email) throws Exception{
		JSONObject res = new JSONObject();
		res.put("action", "ban");
		res.put("status", false);
		User user = null;
		try {
			user = service.findUserByEmail(email);
			if(user.getBan()==null||user.getBan().equals("BAN")) {
				user.setBan("BANNED");
				res.put("ban", "BANNED");
			}else {
				user.setBan("BAN");
				res.put("ban", "BAN");
			}
			service.saveObject(user);
			res.put("value", email);
			
			res.put("status", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			res.put("value", "fail to connect to db");
		}
		System.out.println("ban");
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/updateHistory", method = RequestMethod.POST)
	@ResponseBody
    public void updateHistory(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("songId") int songId) throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		service.updatePlayHistory(user.getId(), songId);
		
		System.out.println("done");
	}
	
	
	@RequestMapping(value = "/changeFee", method = RequestMethod.POST)
	@ResponseBody
    public void changeFee(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("changefee") int changefee) throws Exception{
		Subscriptionfee s = (Subscriptionfee) service.find(Subscriptionfee.class, 1);
		s.setFee(changefee);
		service.saveObject(s);
		JSONObject res = new JSONObject();
		res.put("action", "changeFee");
		res.put("status", true);
		res.put("value", changefee);
		myResponse.print(response, res);
	}
	
	@RequestMapping(value = "/upgrade", method = {RequestMethod.GET, RequestMethod.POST})
    public String upgrade(HttpServletRequest request) throws Exception {
		System.out.println("here");
		request.getSession().setAttribute("fee", service.getSubscriptionfee());
		return "upgrade";
    }
	
	
	@RequestMapping(value = "/addSongToLibrary", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void addSongToLibrary(
    		HttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam("id") String sid) throws Exception {
		int id = Integer.parseInt(sid);
		System.out.println("addSongToLibrary");
		User user = (User) request.getSession().getAttribute("user");
		Song s = (Song) service.find(Song.class, id);
		user.getSongCollection().add(s);
		s.getUserCollection().add(user);
		service.saveObject(s);
		
		
		for(Song d: user.getSongCollection()) {
			System.out.println(d.getName());
		}
    }
	
	
	@RequestMapping(value = "/removeSongFromLibrary", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void removeSongFromLibrary(
    		HttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam("id") String sid) throws Exception {
		int id = Integer.parseInt(sid);
		System.out.println("removeSongFromLibrary");
		User user = (User) request.getSession().getAttribute("user");
		Song song = null;
		for(Song s: user.getSongCollection()) {
			if(s.getId()==id) {
				song = s;
			}
		}
		user.getSongCollection().remove(song);
		song.getUserCollection().remove(user);
		service.saveObject(song);
		
		
		for(Song d: user.getSongCollection()) {
			System.out.println(d.getName());
		}
    }
	
	@RequestMapping(value = "/removeSongFromMyLibrarySongs", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void removeSongFromMyLibrarySongs(
    		HttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam("id") int id) throws Exception {
		System.out.println("removeSongFromMyLibrarySongs");
		User user = (User) request.getSession().getAttribute("user");
		Song song = null;
		for(Song s: user.getSongCollection()) {
			if(s.getId()==id) {
				song = s;
			}
		}
		user.getSongCollection().remove(song);
		song.getUserCollection().remove(user);
		service.saveObject(song);
    }
	
	
	
	@RequestMapping(value = "/changeLanguage", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void changeLanguage(HttpServletRequest request, HttpServletResponse response,
    		@RequestParam("language") String language) throws Exception {
		System.out.println(language);
		JSONObject res = new JSONObject();
		res.put("action", "changeLanguage");
		res.put("status", false);
		res.put("value", "main");
		if(language.equals("Chinese")) {
			request.getServletContext().setAttribute("language", cn);
			res.put("status", true);
		}
		
		if(language.equals("English")) {
			request.getServletContext().setAttribute("language", en);
			res.put("status", true);
		}
		
		myResponse.print(response, res);
    }
	
	
	@RequestMapping(value = "/downgrade", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void downgrade(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("downgrade");
		User user = (User) request.getSession().getAttribute("user");
		user.setType("general");
		service.updateUser(user);
		JSONObject res = new JSONObject();
		res.put("action", "downgrade");
		res.put("status", true);
		res.put("value", "loadUserPage");
		myResponse.print(response, res);
    }
	
	
	@RequestMapping(value = "/adminStatis", method = {RequestMethod.GET, RequestMethod.POST})
    public String adminStatis(HttpServletRequest request) throws Exception{  
   request.getSession().setAttribute("subfee", service.getSubscriptionfee());
   List<Object> userlist = service.findUserStatic();   //return 2 user.type & number
   List<Object> songlist = service.findSongStatic();   //return 5 song.type & number of songs of this type
   List<Object> artistlist =service.findArtistStatic();  //return 3 artist.name & artist.listeners
   long total = service.getTotalUserCount();
   long totalart = service.getTotalArtistCount();
   long totalsong = service.getTotalSongCount();
   long totalal = service.getTotalAlbumCount();
   List<Double> result = service.getTotalIncome();
   double totalIncome=0;
   for(double d : result) {
    totalIncome += d;
   }
 
   Double artistIncome = totalIncome*0.4;
   Double profit = totalIncome*0.6;
   Locale locale = new Locale("en", "US");      
   NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
   List<String> resultprofit = new ArrayList<>();
   resultprofit.add(currencyFormatter.format(totalIncome));
   resultprofit.add(currencyFormatter.format(artistIncome));
   resultprofit.add(currencyFormatter.format(profit));
   request.getSession().setAttribute("totalUser", total);
   
   request.getSession().setAttribute("userStat", userlist);
   request.getSession().setAttribute("gennrStat", songlist);
   request.getSession().setAttribute("topArtist", artistlist);
   request.getSession().setAttribute("totalsong", totalsong);
   request.getSession().setAttribute("totalal", totalal);
   request.getSession().setAttribute("totalart", totalart);
   
   request.getSession().setAttribute(("resultprofit"), resultprofit);
   return "adminStatistic";
  }
	
	
	
	@RequestMapping(value = "/upgradeAccount",method = {RequestMethod.GET, RequestMethod.POST})
    public String upgradeAccount(HttpServletRequest request,
       HttpServletResponse response,
       @RequestParam("cardNumber") String creditCardNumber) throws Exception{
	  User user = (User) request.getSession().getAttribute("user");
	  PaymentHistory ph = new PaymentHistory();
	  Calendar calendar = Calendar.getInstance();
	  Timestamp currentTimestamp = new java.sql.Timestamp(calendar.getTime().getTime());
	  ph.setCreditNumber(creditCardNumber);
	  ph.setPaymentDate(currentTimestamp);
	  NumberFormat formatter = NumberFormat.getCurrencyInstance();
	  String moneyString = formatter.format(service.getSubscriptionfee()*1.0865);
	  ph.setPaymentAmount(moneyString);
	  ph.setPaymenttype("Subscription Fee");
	  ph.setPaymentUserId(user);
	  user.setType("premium");
	  user.getPaymentHistoryCollection().add(ph);
	  service.updateUser(user);
	  request.getSession().setAttribute("user", user);
	  System.out.println("upgrade done");
	  return "main";
	}

}
