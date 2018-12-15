package com.blue.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blue.configuration.BlueEmail;
import com.blue.configuration.MyResponse;
import com.blue.model.Chinese;
import com.blue.model.English;
import com.blue.model.PlayHistory;
import com.blue.model.Playlist;
import com.blue.model.User;
import com.blue.service.UserService;

@Controller
public class HomeController {
	@Autowired
	MyResponse myResponse;
	@Autowired
	UserService service;
	@Autowired
    Environment environment;
	@Autowired
	BlueEmail blueEmail;
	@Autowired
	English en;
	@Autowired
	Chinese cn;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) {
		myResponse.setRootPath(request.getServletContext().getRealPath("/"));
		request.getServletContext().setAttribute("language", en);
//		request.getSession().setAttribute("language", en);
//		return "lyricsSample";
		return "index";
//		return "scrobble";
//		return "sonSsample";
//		return "artistPage";
//		return "admin";
//		return "artistPage";
//		return "addConcert";
//		return "upgrade";
	}
	
	

	
	
	@RequestMapping(value = "/cn", method = RequestMethod.GET)
	public String languageCN(HttpServletRequest request, Locale locale, Model model) {
		myResponse.setRootPath(request.getServletContext().getRealPath("/"));
		request.getServletContext().setAttribute("language", cn);
		return "index";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/viewFriend", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void viewFriend(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("id") int id) throws Exception {
		User friend = service.findById(id);
		for(Playlist p:friend.getPlaylistCollection()) {
			System.out.println(p.getName());
		}
		request.getSession().setAttribute("currentFriend", friend);
		List<String> dates=new ArrayList();
		int index=0;
		for(PlayHistory p: friend.getPlayHistoryCollection() ) {
			dates.add(index, p.getDate().toString());
		    index++;
		}
		request.getSession().setAttribute("fplayHistoryList", dates);
		JSONObject res = new JSONObject();
		res.put("action", "viewFriend");
		res.put("value", "friend");
		myResponse.print(response, res);
	}
	
	@RequestMapping(value = "/friend", method = {RequestMethod.GET, RequestMethod.POST})
    public String openFriendPage() {
		return "friend";
    }
}
