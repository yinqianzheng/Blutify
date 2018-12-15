package com.blue.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.TimeUnit;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blue.model.Album;
import com.blue.model.Artist;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;
import com.blue.service.UserService;

@Controller
public class MyWebSpider {
	
	@Autowired
	UserService service;
	
	@RequestMapping(value = "/scrobble", method = {RequestMethod.GET, RequestMethod.POST})
	public void scrobble() throws Exception {
		
//		User user = (User)service.find(User.class, 2);
//		Song song = (Song)service.find(Song.class, 4);
//		
//		Iterator itr = user.getPlaylistCollection().iterator();
//		Playlist playlist = null;
//		while(itr.hasNext()) {
//			playlist = (Playlist)itr.next();
//			System.out.println(playlist.getName());
//			playlist.addSong(song);
//			break;
//		}
//		service.saveObject(user);
		Scrobble sb = new Scrobble();
//		Artist artist = null;
		int count = 0;
		for(int id=900; id<1000; id++) {
			System.out.println(id);

			try {
				JSONObject albumsJson = sb.findAlbumsByArtistId(id);
				if (sb.getTotal(albumsJson)>1) {
					JSONObject artistJson = sb.findArtist(id);
					if(sb.getTotal(artistJson)!=1) {
						continue;
					}
					artistJson = (JSONObject) sb.getDataSet(artistJson);
					Artist artist = new Artist();
					artist.setName(sb.getArtistName(artistJson));
					artist.setBiography(sb.getArtistBio(artistJson));
					artist.setImageUrl(sb.getArtistImageUrl(artistJson));
					
					JSONArray ja = (JSONArray) sb.getDataSet(albumsJson);
					Collection<Album> albumCollection = new ArrayList<Album>();
					artist.setAlbumCollection(albumCollection);
					for(Object js : ja) {
						Album album = new Album();
						album.setName((String) ((JSONObject)js).get("album_title"));
						album.setImageUrl((String) ((JSONObject)js).get("album_image_file"));
						String info = (String) ((JSONObject)js).get("album_information");
						if(info.length()>=7) {
							info = info.substring(3, info.length()-4);
						}
						album.setDescription(info);
						album.setArtistId(artist);
						albumCollection.add(album);
						JSONObject tracksJson = sb.findTracksByAlbumId((int)((JSONObject)js).get("album_id"));
						int trackNum = sb.getTotal(tracksJson);
						Collection<Song> songCollection = new ArrayList<Song>();
						album.setSongCollection(songCollection);
						if (trackNum==0) {
							continue;
						}else if (trackNum>1) {
							for(Object track : (JSONArray) sb.getDataSet(tracksJson)) {
								Song song = new Song();
								song.setArtistId(artist);
								System.out.println(((JSONObject)track).get("track_title"));
								song.setType((String)   ((JSONObject)((JSONObject)((JSONObject)track).get("track_genres")).get("value")).get("genre_title"));
								song.setName(String.valueOf(((JSONObject)track).get("track_title")));
								song.setDescription((String) ((JSONObject)track).get("track_information"));
	//							song.setPublishedDate((Date) ((JSONObject)track).get("track_date_created"));
								song.setSongClickCount(Integer.parseInt(String.valueOf(    ((JSONObject)track).get("track_listens")  ) ));
								song.setContent("https://freemusicarchive.org/file/" +   ((String) ((JSONObject)track).get("track_file")));
								songCollection.add(song);
							}
						}else {
							JSONObject track = (JSONObject) sb.getDataSet(tracksJson);
							Song song = new Song();
							song.setArtistId(artist);
							song.setName((String) ((JSONObject)track).get("track_title"));
							song.setDescription((String) ((JSONObject)track).get("track_information"));
	//						song.setPublishedDate((Date) ((JSONObject)track).get("track_date_created"));
							song.setContent("https://freemusicarchive.org/file/" +   ((String) ((JSONObject)track).get("track_file")));
							songCollection.add(song);
						}
					}
					service.saveObject(artist);
					System.out.print("-------------------------------------------------count:");
					System.out.println(count++);
					System.out.println(artist.getName());
					System.out.println(artist.getBiography());
					System.out.println(artist.getImageUrl());
					System.out.println(artist.getAlbumCollection().size());
					System.out.println();
					System.out.println();
					for(Album a :artist.getAlbumCollection()) {
						System.out.println("    " +a.getName());
						for(Song s: a.getSongCollection()) {
							System.out.println("        " +s.getName() + ":" + s.getType()  +"   like: " + s.getSongClickCount());
							
						}
					}
				}
				TimeUnit.SECONDS.sleep(10);
			}catch(Exception e) {
				System.out.println(e.getMessage());
				continue;
			}
		}
////		if(artist!=null) {
////			service.saveObject(artist);
////		}
	}

}
