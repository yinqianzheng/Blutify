package com.blue.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blue.configuration.Encryptor;
import com.blue.configuration.MyResponse;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;
import com.blue.service.UserService;

@Controller
public class PlaylistController {
	
	@Autowired
	UserService service;
	@Autowired
	Encryptor encryptor;
	@Autowired
	MyResponse myResponse;
	@Autowired
    Environment environment;
	
	
	@RequestMapping(value = "/createPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void createPlaylist(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("name") String name, 
			@RequestParam("description") String description, 
			@RequestParam("image") MultipartFile[] images) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		boolean isValidName = !user.isExistedPlaylistName(name);
		JSONObject res = new JSONObject();
		res.put("action", "createPlaylist");
		if(isValidName) {
			String targetDir = environment.getRequiredProperty("path.userFiles") 
					+ user.getEmail();
			String imageName = String.valueOf(System.currentTimeMillis()) 
					+ environment.getRequiredProperty("image.format");
			user.createPlaylist(name, description, imageName);
			myResponse.uploadImage(images, targetDir + "/"+ imageName);
			res.put("status", true);
			res.put("value", name);
			try {
				service.saveObject(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			res.put("status", false);
			res.put("value", environment.getRequiredProperty("message.duplicatedName"));
		}
		myResponse.print(response, res);
	}
	

	@RequestMapping(value = "/deletePlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	String deletePlaylist(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("name") String name) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		Playlist pl = user.findPlaylistByName(name);
		if(pl!=null) {
		if(pl.getId()!=null) {
			user.getPlaylistCollection().remove(pl);
			try {
				service.deletePlaylist(pl.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
		request.getSession().setAttribute("user", user);
		return "main";
	}
	
	
	@RequestMapping(value = "/renamePlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void renamePlaylist(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("name") String name) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		boolean isValidName = !user.isExistedPlaylistName(name);
		JSONObject res = new JSONObject();
		res.put("action", "renamePlaylist");
		res.put("status", false);
		if (isValidName) {
			user.findPlaylistByName(name).setName(name);
			res.put("status", true);
			res.put("name", name);
		}
		myResponse.print(response, res);
	}
	

	@RequestMapping(value = "/addSong", method = {RequestMethod.GET, RequestMethod.POST})
	 @ResponseBody
	    public void addSong(HttpServletRequest request,
	       HttpServletResponse response,
	       @RequestParam("id") int id,
	       @RequestParam("name") String name) throws Exception {
	  User user = (User) request.getSession().getAttribute("user");
	  Song song = (Song) service.find(Song.class, id);
	  Playlist pl = user.findPlaylistByName(name);
	  pl.addSong(song);
	  song.getPlaylistCollection().add(pl);
	  service.saveObject(pl);
	  service.saveObject(song);
	  return;
	 }
	
/*	@RequestMapping(value = "/addSong", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public void addSong(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("id") int id,
    			@RequestParam("name") String name) throws Exception {
		print("addSongtoPlaylist");
		Song song = (Song) service.find(Song.class, id);
		print(song.getPlaylistCollection().size());
		User user = (User) request.getSession().getAttribute("user");
		Playlist pl=user.findPlaylistByName(name);
		user.findPlaylistByName(name).addSong(song);

		song.getPlaylistCollection().add(pl);
		service.saveObject(song);
		service.saveObject(pl);
		return;
    }*/
	
	
	@RequestMapping(value = "/removeSongFromPlaylist", method = RequestMethod.POST)
	@ResponseBody
    public void removeSong(HttpServletRequest request,
    			HttpServletResponse response,
    			@RequestParam("id") int id,
    			@RequestParam("name") String name) throws Exception {
		System.out.println(id + name);
		User user = (User) request.getSession(false).getAttribute("user");
		Playlist pl = user.findPlaylistByName(name);
		pl.removeSong(id);
		service.deleteSongInPlaylist(pl, id);
		request.getSession(false).setAttribute("currentPlaylist", pl);
		
		String songlistStr = "";
		for(Song s: pl.getSongCollection()) {
			songlistStr = songlistStr +s.getName() + ";!; " + s.getContent() + ";!; " + s.getId() + ";;721;;";
		}
		if (songlistStr.length()>0) {
			songlistStr = songlistStr.substring(0, songlistStr.length()-7);
		}
		songlistStr = songlistStr.replaceAll(",", "-");
		request.getSession(false).setAttribute("wocao", songlistStr);
		return;
    }
	
	
	
	@RequestMapping(value = "/editPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	 @ResponseBody
	 void editPlaylist(
		   HttpServletRequest request, 
		   HttpServletResponse response,
		   @RequestParam("name") String name, 
		   @RequestParam("newName") String newName, 
		   @RequestParam("description") String description, 
		   @RequestParam("image") MultipartFile[] images) throws Exception {
		  System.out.println("editPlaylist");
		  System.out.println(request.getSession().getId());
		  System.out.println(name);
		  System.out.println(newName);
		  System.out.println(description);
		  User user = (User) request.getSession().getAttribute("user");
		  boolean isValidName = !user.isExistedPlaylistName(newName);
		  JSONObject res = new JSONObject();
		  res.put("action", "editPlaylist");
		  if(isValidName||name.equals(newName)) {
		   Playlist pl = user.findPlaylistByName(name);
		   String targetDir = environment.getRequiredProperty("path.userFiles") 
		     + user.getEmail();
		   String imageName = pl.getImageUrl();
		   if(!images[0].isEmpty()) {
			   imageName = String.valueOf(System.currentTimeMillis()) 
						+ environment.getRequiredProperty("image.format");
			   myResponse.uploadImage(images, targetDir + "/"+ imageName);
		   }
		   pl.setImageUrl(imageName);
		   pl.setDescription(description);
		   pl.setName(newName);
		   res.put("status", true);
		   res.put("name", newName);
		   res.put("description", description);
		   service.updateUserPlaylist(user);
		   request.getSession().setAttribute("currentPlaylist", pl);
		   request.getSession().setAttribute("imageFile",
					environment.getRequiredProperty("path.userFiles")
					+user.getEmail()+"/"+imageName);
		   res.put("imageFile", environment.getRequiredProperty("path.userFiles")
					+user.getEmail()+"/"+imageName);
		  }else {
		   res.put("status", false);
		   res.put("value", environment.getRequiredProperty("message.duplicatedName"));
		  }
		  myResponse.print(response, res);
	 }
	
	
//	@RequestMapping(value = "/editPlaylistImage", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	void renamePlaylist(
//			HttpServletRequest request, 
//			HttpServletResponse response,
//			@RequestParam("id") int id,
//			@RequestParam("image") MultipartFile[] images) throws Exception {
//		User user = (User) request.getAttribute("name");
//		Playlist pl = (Playlist) service.find(Playlist.class, id);
//		JSONObject res = new JSONObject();
//		res.put("action", "editPlaylist");
//		res.put("status", false);
//		if(pl!=null) {
//			String targetDir = environment.getRequiredProperty("path.userFiles") 
//					+ user.getEmail();
//			String imageName = pl.getImageUrl();
//			user.getPlaylistCollection().add(pl);
//			myResponse.uploadImage(images, targetDir + "/"+ imageName);
//			res.put("status", true);			
//		}else {
//			res.put("status", false);
//			res.put("value", "some unexpected errors occured");
//		}
//		myResponse.print(response, res);
//	}
//	
//	
//	@RequestMapping(value = "/changePlaylistImage", method = RequestMethod.POST)
//	@ResponseBody
//    public void changePlaylistImage(HttpServletRequest request,
//    			HttpServletResponse response,
//    			@RequestParam("name") String name,
//    			@RequestParam("image") MultipartFile[] image) throws Exception {
//		User user = (User) request.getSession().getAttribute("user");
//		Playlist playlist = user.findPlaylistByName(name);
//		String imagePath = environment.getRequiredProperty("path.userFiles")
//				+ "/" + playlist.getImageUrl();
//		myResponse.uploadImage(image, imagePath);
//		return;
//    }
}
