package com.blue.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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
import com.blue.model.ArtistUser;
import com.blue.model.Concert;
import com.blue.model.PlayHistory;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;
import com.blue.service.UserService;
import com.google.gson.Gson;

@Controller
public class newUserController {
		
		@Autowired
		UserService service;
		@Autowired
		MyResponse myResponse;
		@Autowired
	    Environment environment;
		@Autowired
		Encryptor encryptor;
		
		@RequestMapping(value = "/mysongs.html", method = {RequestMethod.GET, RequestMethod.POST})
	     		public String viewMySongPage() {
			return "mySongs";
	     }
		
		@RequestMapping(value = "/viewMySongs", method = {RequestMethod.GET, RequestMethod.POST})
		  @ResponseBody
		  void viewMySongs(
		    HttpServletRequest request, 
		    HttpServletResponse response,
		    @RequestParam("id") int id) throws Exception {
		   User user = service.findById(id);
		   List<Song> songs = (List<Song>) user.getSongCollection();
		   request.getSession().setAttribute("myLibrarySongs", songs);
		   print("viewMySongs"+songs.size());
		   JSONObject res = new JSONObject();
		   res.put("action", "viewMySongs");
		   res.put("value", "mysongs.html");
		   myResponse.print(response, res);
		}

		@RequestMapping(value = "/searchSongByName", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void searchSongByName(@RequestParam("name") String name) throws Exception{
			print(name);
			print("searchSongByName");
			List<Song> songList = service.searchSongByName(name);
		}
		
		@RequestMapping(value = "/searchSongByType", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void searchSongByType(@RequestParam("type") String type) throws Exception{
			print(type);
			print("searchSongByType");
			List<Song> songList = service.searchSongByType(type);
		}
		
		@RequestMapping(value = "/searchAlbumByName", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void searchAlbumByType(@RequestParam("name") String name) throws Exception{
			print(name);
			print("searchAlbumByName");
			List<Album> albumList = service.searchAlbumByName(name);
			print(albumList.size());
		}
		
		@RequestMapping(value = "/searchArtistByName", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void searchAlbumByArtist(@RequestParam("name") String name) throws Exception{
			print(name);
			print("searchArtistByName");
			List<Artist> artistList = service.searchArtistByName(name);
			print(artistList.size());
		}
		
		@RequestMapping(value = "/searchPlaylistByName", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void searchPlaylistByName(@RequestParam("name") String name) throws Exception{
			print(name);
			print("searchPlaylistByName");
			List<Playlist> playlistList = service.searchPlaylistByName(name);
			print(playlistList.size());
		}
		
		

		@RequestMapping(value = "/searchConcertByName", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void searchConcertByName(@RequestParam("name") String name) throws Exception{
			print(name);
			print("searchConcertByName");
			List<Concert> concertList = service.searchConcertByName(name);
			print(concertList.size());
		}
		
		
		
		@RequestMapping(value = "/saveAlbum", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void saveAlbum(
				HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("id") int id) throws Exception {
			print("saveAlbum");
//			request.getSession(true);
//			int userId = 1;
//			User user =service.findById(userId);
			Album al=(Album) service.find(Album.class, id);
			User user = (User) request.getSession().getAttribute("user");
			user.addAlbum(al);
			al.addUser(user);
			service.saveObject(al);
			service.saveObject(user);
			print("finish saveAlbum");
		}
		
		
		@RequestMapping(value = "/unsaveAlbum", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void unsaveAlbum(
				HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("id") int id) throws Exception {
//			request.getSession(true);
//			int userId = 1;
//			User user =service.findById(userId);
			
			print("unsaveAlbum");
			Album al=(Album) service.find(Album.class, id);
			User user = (User) request.getSession().getAttribute("user");
			user.deleteAlbum(al);
			al.deleteUser(user);
			service.saveObject(al);
			service.saveObject(user);
			print("finish unsaveAlbum");
		}
		
		
		@RequestMapping(value = "/followPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void followPlaylist(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {
			print("followPlaylist");
			User user = (User) request.getSession().getAttribute("user");
			Playlist pl=(Playlist) service.find(Playlist.class, id);
			print(pl.getUserCollection().size());
			print(user.getFollowedPlaylistCollection().size());
			
			user.addFollowedPlaylist(pl);
		
			pl.addUser(user);
			print("here2");
			print(pl.getUserCollection().size());
			print(user.getFollowedPlaylistCollection().size());
			service.saveObject(pl);
			service.saveObject(user);
			print("followPlaylist finished");			
	    }


		@RequestMapping(value = "/unFollowPlaylist", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void unFollowPlaylist(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {
//			int userId = 1;
//			request.getSession(true);
//			User user = service.findById(userId);
			print("unFollowPlaylist");
			User user = (User) request.getSession().getAttribute("user");
			Playlist pl=(Playlist) service.find(Playlist.class, id);
			user.deleteFollowedPlaylist(pl);
			pl.deleteUser(user);
			service.saveObject(pl);
			service.saveObject(user);
			print("unFollowPlaylist finished");
	    }

		
		@RequestMapping(value = "/followArtist", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void followArtist(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {

//			request.getSession(true);
//			int userId = 1;
//			User user = service.findById(userId);	
			
			print("followArtist");
			User user = (User) request.getSession().getAttribute("user");
			Artist ar= (Artist) service.find(Artist.class, id);
			print(ar.getUserCollection().size());
			print(user.getArtistCollection().size());
			
			user.addFollowedArtist(ar);
		
			ar.addUser(user);
			print("here2");
			print(ar.getUserCollection().size());
			print(user.getArtistCollection().size());
			service.saveObject(ar);
			service.saveObject(user);
			print("followArtist finished");			
	    }


		@RequestMapping(value = "/unFollowArtist", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void unFollowArtist(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {
//			int userId = 1;
//			request.getSession(true);
//			User user = service.findById(userId);
			print("unFollowArtist");
			User user = (User) request.getSession().getAttribute("user");
			Artist ar= (Artist) service.find(Artist.class, id);
			user.deleteFollowedArtist(ar);
			ar.deleteUser(user);
			service.saveObject(ar);
			service.saveObject(user);
			print("unFollowArtist finished");
	    }
		
		
		@RequestMapping(value = "/viewMyAlbums", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void viewMyAlbums(
				HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("id") int id) throws Exception {
			print("viewMyAlbums");
			print(id);
			User user = service.findById(id);
			List<Album> albums = (List<Album>) user.getAlbumCollection();
			
			print("albumscollection "+albums.size());
			request.getSession().setAttribute("myAlbums", albums);
			
			JSONObject res = new JSONObject();
			res.put("action", "viewMyAlbums");
			res.put("value", "myalbums.html");
			myResponse.print(response, res);
		}
		
		@RequestMapping(value = "/myalbums.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewMyAlbumPage() {
			return "myalbums";
	    }
		
		
		@RequestMapping(value = "/viewMyArtists", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void viewMyArtists(
				HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("id") int id) throws Exception {
			print("viewMyArtists");
			print(id);
			User user = service.findById(id);
			List<Artist> artists = (List<Artist>) user.getArtistCollection();
			print("artists "+artists.size());
			request.getSession().setAttribute("mainArtists", artists);
			
			JSONObject res = new JSONObject();
			res.put("action", "viewMyArtists");
			res.put("value", "myartists.html");
			myResponse.print(response, res);
		}
		
		
		@RequestMapping(value = "/myartists.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewMyArtistPage() {
			return "myartists";
	    }
		
		
		@RequestMapping(value = "/viewPublicPlaylists", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void viewPublicPlaylists(
				HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("id") int id) throws Exception {
			print("viewPublicPlaylists");
//			request.getSession(true);
			List<Playlist> publicPlaylists = service.getPlaylists(20);					
			print("playlists size is "+ publicPlaylists.size());
			request.getSession().setAttribute("publicPlaylists", publicPlaylists);
			for(Playlist p: publicPlaylists) {
				print(p.getName());
			}

			JSONObject res = new JSONObject();
			res.put("action", "viewPublicPlaylists");
			res.put("value", "publicPlaylists.html");
			myResponse.print(response, res);
		}
		
		
		
		@RequestMapping(value = "/publicPlaylists.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewPublicPlaylistsPage() {
			return "publicPlaylists";
	    }
		
		
		
		@RequestMapping(value = "/viewPopularSongs", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void viewPopularSongs(
				HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
			print("viewPopularSongs");
//			request.getSession(true);
			List<Song> popularSongs = service.getSongs(20);					
			print("playlists size is "+ popularSongs.size());
			request.getSession().setAttribute("popularSongs", popularSongs);
			for(Song s: popularSongs) {
				print(s.getName()+ " "+ s.getSongClickCount());
			}

			JSONObject res = new JSONObject();
			res.put("action", "viewPopularSongs");
			res.put("value", "publicSongs.html");
			myResponse.print(response, res);
		}
		
		
		
		@RequestMapping(value = "/publicSongs.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewPopularSongsPage() {
			return "popularSongs";
	    }
		
		@RequestMapping(value = "/viewPopularArtists", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		void viewPopularArtists(
				HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam("id") int id) throws Exception {
			print("viewPopularArtists");
			List<Artist> popularArtists = service.getArtists(20);					
			print("popularArtists size is "+ popularArtists.size());
			request.getSession().setAttribute("popularArtists", popularArtists);
			for(Artist ar: popularArtists) {
				print(ar.getName());
			}

			JSONObject res = new JSONObject();
			res.put("action", "viewPopularArtists");
			res.put("value", "popularArtists.html");
			myResponse.print(response, res);
		}
		
		
		
		@RequestMapping(value = "/popularArtists.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewPopularArtistsPage() {
			return "popularArtists";
	    }
		
		
		@RequestMapping(value = "/cancelSubscription", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void cancelSubscription(HttpServletRequest request,
	    			HttpServletResponse response) throws Exception {
			print("cancelSubscription");
			User user = (User) request.getSession().getAttribute("user");
			print("User Account Type: "+ user.getType());
			user.setType("general");
			service.updateUser(user);
			User check=service.findById(user.getId());
			print(check.getType());
			print("cancelSubscription");
			request.getSession().setAttribute("user",user);
		}
		
		@RequestMapping(value = "/addFriend", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void addFriend(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("nickname") String name) throws Exception {
			User user =(User) request.getSession().getAttribute("user");
//			request.getSession(true);

			JSONObject res = new JSONObject();
			int flag=0;
			
			for(User u: user.getUserCollection1()) {
				if(u.getNickname().equals(name)) {
					print("FriendExisted");
					res.put("value", "friendExisted");
					flag=1;
				}
			}
			if(flag == 0) {
				User friend = new User();
				friend = service.findFriendByNickName(name);
				if(friend==null) {
					print("User not exists");
					res.put("value", "User not exists");
				}else {
					print("Success");
					res.put("value", "Success");
					System.out.println(friend.getNickname());
					user.getUserCollection1().add(friend);
					user.getUserCollection().add(friend);
					friend.getUserCollection().add(user);
					friend.getUserCollection1().add(user);
					service.saveObject(user);
					print("there");
					service.saveObject(friend);
					print("here");
					res.put("action", "addFriend");
					res.put("returnId", friend.getId());
					res.put("returnName", friend.getNickname());
				}
			}
			request.getSession().setAttribute("user",user);
			myResponse.print(response, res);
			print("friend added");
		}
		
		
		@RequestMapping(value = "/removeFriend", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void removeFriend(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("nickname") String name) throws Exception {
			User user = (User) request.getSession().getAttribute("user");
			User friend = service.findFriendByNickName(name);	
			user.getUserCollection1().remove(friend);
			user.getUserCollection().remove(friend);
			friend.getUserCollection().remove(user);
			friend.getUserCollection1().remove(user);
			service.saveObject(user);
			service.saveObject(friend);
			print("deleted friend");
			request.getSession().setAttribute("user",user);
			JSONObject res = new JSONObject();
			res.put("returnName", friend.getNickname());
			myResponse.print(response, res);
		}
		
		@RequestMapping(value = "/viewSongsStatics", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void viewSongsStatics(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {
			print("viewSongsStatics");
			Artist artist = (Artist) service.find(Artist.class, id);
//			Artist Artist = (Artist) request.getSession().getAttribute("Artist");
			List<Song> songsList = (List<Song>) artist.getSongCollection();
			for(Song s: songsList) {
				print(s.getId()+" "+s.getName()+ " "+s.getSongClickCount());
			}
			print("songsList "+ songsList.size());
			request.getSession().setAttribute("songsList",songsList);
		}

		
		@RequestMapping(value = "/viewArtistRoyalties", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void viewArtistRoyalties(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {
			print("viewArtistRoyalties");
			print(id);
			Artist artist = (Artist) service.find(Artist.class, id);			
//			Artist Artist = (Artist) request.getSession().getAttribute("Artist");
			long number = service.FindTotalPremium();
			long number2 = service.FindTotalSongListener();
			double paytoArtistFee = number/2.0;
			double perListenerFee = paytoArtistFee / number2;
			print("perListenerFee "+ perListenerFee);
			double totalsalary=0.00;
			List<Song> songsRoyalties = (List<Song>) artist.getSongCollection(); 	
			DecimalFormat df = new DecimalFormat("#.##");
			NumberFormat numberFormat1 = NumberFormat.getNumberInstance();
			for(Song s: songsRoyalties) {
				int listerner = s.getSongClickCount();
				int persongListener = s.getSongClickCount();
				double income =(double) persongListener * perListenerFee;
				double value = Double.parseDouble(df.format(income));
				totalsalary += value;
				s.setIncome(numberFormat1.format(value));
				service.saveObject(s);
			}
			service.saveObject(artist);
			for(Song s: songsRoyalties) {
				print("income "  + s.getIncome());
			}
			String artistname = artist.getName();
			double newsalry = Double.parseDouble(df.format(totalsalary));
			print(artistname);
			request.getSession().setAttribute("totalsalary", newsalry);
			request.getSession().setAttribute("songsRoyalties",songsRoyalties);
			request.getSession().setAttribute("artist", artist);
		}
		
		@RequestMapping(value = "/viewArtistPage", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void viewArtistPage(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {
			print("viewArtistPage");
			print(id);
//			ArtistUser au = (ArtistUser) service.find(ArtistUser.class, id);
			Artist artist = (Artist) request.getSession().getAttribute("artist");
			int totalsongs = artist.getSongCollection().size();
			double totallisterners =0 ;
			
			for(Song s: artist.getSongCollection()) {
				totallisterners += s.getSongClickCount();
			}
			DecimalFormat df = new DecimalFormat("#");
			NumberFormat numberFormat1 = NumberFormat.getNumberInstance();
			totallisterners =Double.parseDouble(df.format(totallisterners));
			artist.setTotalListeners(numberFormat1.format(totallisterners));
			artist.setTotalSongs(Integer.toString(totalsongs));
			print(totallisterners);
			print(totalsongs);
			service.saveObject(artist);
			request.getSession().setAttribute("artistInfo",artist);
			JSONObject res = new JSONObject();
			res.put("action", "viewArtistPage");
			res.put("value", "artistinner.html");
			request.getSession().setAttribute("artist", artist);
			myResponse.print(response, res);
		}
		

		@RequestMapping(value = "/artistinner.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewArtistPage() {
			return "artistinner";
	    }
		
		
		@RequestMapping(value = "/saveArtistEdit", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void saveArtistEdit(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("artistName") String name,
	    			@RequestParam("artistBio") String bio) throws Exception {
			Artist artist = (Artist) request.getSession().getAttribute("artist");
			print("here");
			print(name);
			print(bio);
			artist.setName(name);
			artist.setBiography(bio);
			JSONObject res = new JSONObject();
			res.put("action", "saveArtistEdit");
			res.put("value", "artistinner1.html");
			request.getSession().setAttribute("artist", artist);
			service.saveObject(artist);
			myResponse.print(response, res);
		}
		
		@RequestMapping(value = "/artistinner1.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String saveArtistEdit() {
			return "artistinner";
	    }
		
		
		@RequestMapping(value = "/viewWelcomePage", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void viewWelcomePage(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("id") int id) throws Exception {
			Artist artist = (Artist) service.find(Artist.class, id);
			print("here");
			JSONObject res = new JSONObject();
			res.put("action", "saveArtistEdit");
			res.put("value", "welcomeArtist.html");
			request.getSession().setAttribute("artist", artist);
			myResponse.print(response, res);
		}
		
		@RequestMapping(value = "/welcomeArtist.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewWelcomePage() {
			return "artistPage";
	    }
				
		@RequestMapping(value="/artistlogin", method={RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    void artistlogin(HttpServletRequest request,
	    			HttpServletResponse response,
	    			@RequestParam("email") String email,
	    			@RequestParam("password") String password) throws Exception {
			print("artistlogin");
			ArtistUser artistUser = service.findArtistUser(email);
			Artist artist = artistUser.getArtistInfoId();
			List<Album> albums = (List<Album>) artist.getAlbumCollection();
			JSONObject res = new JSONObject();
			res.put("action", "artistlogin");
			res.put("value", "artistPage.html");
			List<Artist> artistList = service.findRelatedArtists(artist.getId());
			print("viewrelatedArtists");
			List<Artist> newartistList = new ArrayList();
			for(Artist a: artistList) {
				print(a.getId()+" "+artist.getId());
				if(a.getId().equals(artist.getId())) {
					continue;
				}else{
					newartistList.add(a);
				}
			}
			print(newartistList.size());
			request.getSession().setAttribute("artistList", newartistList);
			request.getSession().setAttribute("albums", albums);
			request.getSession().setAttribute("artist", artist);
			myResponse.print(response, res);
		}
		
		@RequestMapping(value = "/artistPage.html", method = {RequestMethod.GET, RequestMethod.POST})
	    public String viewartistPage() {
			return "artistPage";
	    }
				
		
//		@RequestMapping(value="/viewrelatedArtists", method={RequestMethod.GET, RequestMethod.POST})
//		@ResponseBody
//	    void viewrelatedArtists(HttpServletRequest request,
//	    			HttpServletResponse response) throws Exception {
//			print("viewrelatedArtists");
//			Artist artist = (Artist) request.getSession().getAttribute("artist");
//			List<Artist> artistList = service.findRelatedArtists(artist.getId());
//			print("viewrelatedArtists");
//			request.getSession().setAttribute("artistList", artistList);
//			request.getSession().setAttribute("artist", artist);
//		}
//		
/*		@RequestMapping(value = "/loadHistory", method = {RequestMethod.GET, RequestMethod.POST})
	    public String loadHistory(HttpServletRequest request) {
			User u = (User) request.getSession().getAttribute("user");
			print(u.getId());
			List<PlayHistory> playHistoryList = (List<PlayHistory>) u.getPlayHistoryCollection();
			List<String> dates=new ArrayList();
			int index=0;dw
			for(PlayHistory p: u.getPlayHistoryCollection() ) {
				dates.add(index, p.getDate().toString());
				print(p.getDate().getClass());
				index++;
			}		
			print(dates.get(0));
			request.getSession().setAttribute("playHistoryList", dates);
			return "playHistory";
	    }*/
		
		protected void print(Object c) {
			System.out.println(c);
		}
		
		
	}

