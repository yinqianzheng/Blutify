package com.blue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blue.model.Playlist;
import com.blue.model.User;


@Controller
public class SortController {

	public SortController() {
		// TODO Auto-generated constructor stub
	}
	
/*	@RequestMapping(value = "/sortPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void viewFriend(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("type") String type) throws Exception {
		Playlist playlist = (Playlist) request.getSession().getAttribute("currentPlaylist");
		playlist.sort(type);
	}*/

}
