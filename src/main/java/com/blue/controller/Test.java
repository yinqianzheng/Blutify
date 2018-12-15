//package com.blue.controller;
//
//import java.awt.image.BufferedImage;
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStream;
//import java.security.NoSuchAlgorithmException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.imageio.ImageIO;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.env.Environment;
//import org.springframework.http.MediaType;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.blue.configuration.Encryptor;
//import com.blue.configuration.MyResponse;
//import com.blue.model.Album;
//import com.blue.model.Artist;
//import com.blue.model.Concert;
//import com.blue.model.Playlist;
//import com.blue.model.Song;
//import com.blue.model.User;
//import com.blue.service.UserService;
//import com.google.gson.Gson;
//
//@Controller
//public class Test {
//	
//	@Autowired
//	UserService service;
//	@Autowired
//	MyResponse myResponse;
//	@Autowired
//    Environment environment;
//	@Autowired
//	Encryptor encryptor;
//	
//	
//	
//	
//	
//	@RequestMapping(value = "/searchSongByName", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	void searchSongByName(@RequestParam("name") String name) throws Exception{
//		print(name);
//		print("searchSongByName");
//		List<Song> songList = service.searchSongByName(name);
//	}
//	
//	@RequestMapping(value = "/searchSongByType", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	void searchSongByType(@RequestParam("type") String type) throws Exception{
//		print(type);
//		print("searchSongByType");
//		List<Song> songList = service.searchSongByType(type);
//	}
//	
//	@RequestMapping(value = "/searchAlbumByName", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	void searchAlbumByType(@RequestParam("name") String name) throws Exception{
//		print(name);
//		print("searchAlbumByName");
//		List<Album> albumList = service.searchAlbumByName(name);
//		print(albumList.size());
//	}
//	
//	@RequestMapping(value = "/searchArtistByName", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	void searchAlbumByArtist(@RequestParam("name") String name) throws Exception{
//		print(name);
//		print("searchArtistByName");
//		List<Artist> artistList = service.searchArtistByName(name);
//		print(artistList.size());
//	}
//	
//	@RequestMapping(value = "/searchPlaylistByName", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	void searchPlaylistByName(@RequestParam("name") String name) throws Exception{
//		print(name);
//		print("searchPlaylistByName");
//		List<Playlist> playlistList = service.searchPlaylistByName(name);
//		print(playlistList.size());
//	}
//	
//	
//
//	@RequestMapping(value = "/searchConcertByName", method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	void searchConcertByName(@RequestParam("name") String name) throws Exception{
//		print(name);
//		print("searchConcertByName");
//		List<Concert> concertList = service.searchConcertByName(name);
//		print(concertList.size());
//	}
//	
//	
//	
//	protected void print(Object c) {
//		System.out.println(c);
//	}
//	
//	
//}
