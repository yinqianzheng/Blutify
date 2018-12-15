package com.blue.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
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
import com.blue.model.Album;
import com.blue.model.Artist;
import com.blue.model.Language;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;
import com.blue.service.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	@Autowired
	MyResponse myResponse;
	@Autowired
    Environment environment;
	@Autowired
	Encryptor encryptor;
	
	
	@RequestMapping(value = "/viewProfile", method = {RequestMethod.GET, RequestMethod.POST})
    			public String viewProfile() {
		return "editProfile";
    }
	
	@RequestMapping(value = "/viewHistory", method = {RequestMethod.GET, RequestMethod.POST})
    	public String viewHistory() {
		return "payment";
    }
	
	@RequestMapping(value = "/loadPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void loadPlaylist(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("name") String name) throws IOException {
		System.out.println(name);
		User user = (User) request.getSession().getAttribute("user");
		Playlist playlist = user.findPlaylistByName(name);
		request.getSession().setAttribute("currentPlaylist", playlist);
		request.getSession().setAttribute("imageFile",
				environment.getRequiredProperty("path.userFiles")
				+user.getEmail()+"/"+playlist.getImageUrl());
		JSONObject res = new JSONObject();
		res.put("action", "loadPlaylist");
		res.put("value", "playlist.html");
		myResponse.print(response, res);
	}
/*	@RequestMapping(value = "/loadPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
	String loadPlaylist1(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("name") String name) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		Playlist playlist = user.findPlaylistByName(name);
		request.getSession().setAttribute("currentPlaylist", playlist);
		String songlistStr = "";
		for(Song s: playlist.getSongCollection()) {
			songlistStr = songlistStr +s.getName() + ";!; " + s.getContent() + ";;721;;";
		}
		if (songlistStr.length()>0) {
			songlistStr = songlistStr.substring(0, songlistStr.length()-7);
		}
		songlistStr = songlistStr.replaceAll(",", "-");
		request.getSession().setAttribute("wocao", songlistStr);
		request.getSession().setAttribute("imageFile",
				environment.getRequiredProperty("path.userFiles")
				+user.getEmail());
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		JSONObject res = new JSONObject();
		res.put("action", "loadPlaylist");
		res.put("value", "playlist.html");
		return "playlist";
	}*/
	
	@RequestMapping(value = "/viewAlbum", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void viewAlbum(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("id") int id) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		Album album = (Album) service.getAlbum(Album.class, id);
		String songlistStr = "";
		for(Song s: album.getSongCollection()) {
			songlistStr = songlistStr +s.getName() + ";!; " + s.getContent() + ";;721;;";
		}
		if (songlistStr.length()>0) {
			songlistStr = songlistStr.substring(0, songlistStr.length()-7);
		}
		songlistStr = songlistStr.replaceAll(",", "-");
		request.getSession().setAttribute("currentAlbum", album);
		request.getSession().setAttribute("saveStatus", ((Language)request.getServletContext().getAttribute("language")).getSave());
		request.getSession().setAttribute("color", "color: #aaaaaa");
		for(Album a : user.getAlbumCollection()) {
			if(a.getId()==id) {
				request.getSession().setAttribute("saveStatus", ((Language)request.getServletContext().getAttribute("language")).getSaved());
				request.getSession().setAttribute("color", "color: #1ed780");
				break;
			}
		}
		request.getSession().setAttribute("wocao", songlistStr);
		JSONObject res = new JSONObject();
		res.put("action", "viewAlbum");
		res.put("value", "album.html");
		myResponse.print(response, res);
	}
	
	
	@RequestMapping(value = "/viewArtist", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void viewArtist(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam("id") int id) throws Exception {
		Artist artist = (Artist)service.find(Artist.class, id);
		User user = (User) request.getSession().getAttribute("user");
		request.getSession().setAttribute("currentArtist", artist);
		request.getSession().setAttribute("followStatus", "Follow");
		for(Artist a : user.getArtistCollection()) {
			if(a.getId()==id) {
				request.getSession().setAttribute("followStatus", "Followed");
				break;
			}
		}
		JSONObject res = new JSONObject();
		res.put("action", "viewArtist");
		res.put("value", "artist.html");
		myResponse.print(response, res);
	}
	
	@RequestMapping(value = "/viewBrowse", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void viewBrowse(
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		JSONObject res = new JSONObject();
		res.put("value", "loadMain");
		myResponse.print(response, res);
	}
	
	@RequestMapping(value = "/loadMain", method = {RequestMethod.GET, RequestMethod.POST})
    public String loadMain() {
		return "inner";
    }
	
	@RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
    public String reflesh() {
		return "main";
    }

	@RequestMapping(value = "/viewConcert", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void viewConcert(
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		JSONObject res = new JSONObject();
		res.put("value", "loadConcert");
		myResponse.print(response, res);
	}
	
	@RequestMapping(value = "/loadConcert", method = {RequestMethod.GET, RequestMethod.POST})
    public String loadConcert() {
		return "concert";
    }
	@RequestMapping(value = "/artist.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewArtist() {
		return "artist";
    }
	
	

	
	@RequestMapping(value = "/loadHistory", method = {RequestMethod.GET, RequestMethod.POST})
    public String loadHistory() {
		return "playHistory";
    }
	
	
	@RequestMapping(value = "/playlist.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String loadPlaylistPage() {
		return "playlist";
    }
	
	@RequestMapping(value = "/album.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewAlbumPage() {
		return "album";
    }
	
	
	@RequestMapping(value = "/portfolio", method = {RequestMethod.GET, RequestMethod.POST})
    public String loadPortfolio() {
		return "profile";
    }
	
	@RequestMapping(value = "/loadSearchPage", method = {RequestMethod.GET, RequestMethod.POST})
    public String loadSearchPage() {
		return "searchResult";
    }
	
	
	@RequestMapping(value = "/uploadFile1", method = {RequestMethod.GET, RequestMethod.POST})
	ModelAndView uploadFile(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("file") MultipartFile[] files) throws IOException, ServletException {
		String rootPath = request.getServletContext().getRealPath("/");
		String targetPath = rootPath + environment.getRequiredProperty("path.userFiles")
		+ "wocaole@gmail.com";
		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().isEmpty()) {
				System.out.println(file.getOriginalFilename());
				InputStream inputStream = file.getInputStream();
				BufferedImage bufferedImage = ImageIO.read(inputStream);
				File outputfile = new File(targetPath + "/wocaole.jpeg");
		    		if(!outputfile.exists()) outputfile.mkdirs();
				ImageIO.write(bufferedImage, "jpeg", outputfile);
			}
		}
		return new ModelAndView("signUp");
		
	}
	
	
	@RequestMapping(value = "/overAllSearch", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	void searchAll(
			HttpServletRequest request,
			@RequestParam("keyWord") String keyWord) {
		request.getSession().setAttribute("searchResultArtists", null);
		request.getSession().setAttribute("searchResultAlbums", null);
		request.getSession().setAttribute("searchResultSongs", null);
		request.getSession().setAttribute("searchResultGennr", null);
		request.getSession().setAttribute("searchResultPlaylists", null);
		try {
			List<Artist> artists = service.searchArtistByName(keyWord);
			request.getSession().setAttribute("searchResultArtists", artists);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			List<Album> albums = service.searchAlbumByName(keyWord);
			request.getSession().setAttribute("searchResultAlbums", albums);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Song> songs = null;
		try {
			songs = service.searchSongByName(keyWord);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if(songs==null||songs.size()==0) {
				songs = service.searchSongByType(keyWord);
			}else {
				songs.addAll(service.searchSongByType(keyWord));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("searchResultSongs", songs);
		for(Song s: songs)
		{
			System.out.println(s.getName());
		}
		try {
			List<Playlist> playlists = service.searchPlaylistByName(keyWord);
			request.getSession().setAttribute("searchResultPlaylists", playlists);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
//	@RequestMapping(value ="/signup", method = RequestMethod.POST)  
//	public ModelAndView register(HttpServletRequest request,HttpServletResponse res) { 
//		String nickname = request.getParameter("userName");
//		String email = request.getParameter("email");  
//		String password = request.getParameter("password");
////		String firstname = request.getParameter("firstname");
////		String lastname = request.getParameter("lastname");
//
//		User user = new User(nickname,email,password,"aa","aa");
//		UserDAOImpl userdao = new UserDAOImpl(); // move it to servlet context
//		serivce.save(user);
//		return new ModelAndView("welcomepage");
//	}
//	
//	@RequestMapping(value ="/find", method = RequestMethod.GET)
//	public ModelAndView find(HttpServletRequest request,HttpServletResponse res) { 
//		String id = request.getParameter("find");
//		int userId=Integer.parseInt(id);
//		UserDAOImpl userdao = new UserDAOImpl(); // move it to servlet context
//		User u = serivce.findById(userId);
//		if(u==null) {
//			System.out.println("MMP!!!");
//		}
//		else {
//			System.out.println(u.getNickName());
//		}
//		return new ModelAndView("welcomepage");
//	}
//	
//	@RequestMapping(value ="/delete", method = RequestMethod.GET)
//	public ModelAndView delete(HttpServletRequest request,HttpServletResponse res) { 
//			String email = request.getParameter("delete");
//			System.out.println(email);
//			UserDAOImpl userdao = new UserDAOImpl(); // move it to servlet context
//			serivce.deleteUserByEmail(email);
//			return new ModelAndView("welcomepage");
//	}
//	
//	
//	@RequestMapping(value ="/update", method = RequestMethod.POST)
//	public ModelAndView update(HttpServletRequest request,HttpServletResponse res) { 
//			System.out.println("here!!!!");
//			String id=request.getParameter("id");
//			String nickname = request.getParameter("nickname");
//			User user=new User();
//			int userId=Integer.parseInt(id);
//			user = new User(nickname,null,null,null,null);
//			user.setId(userId);
//			UserDAOImpl userdao = new UserDAOImpl(); // move it to servlet context
//			System.out.println("controller"+user.getId());
//			serivce.updateUser(user);
//			return new ModelAndView("welcomepage");
//	}
	
	protected void print(Object c) {
		System.out.println(c);
	}
	
	
}
