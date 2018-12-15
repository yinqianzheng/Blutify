package com.blue.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.blue.dao.UserDAO;
import com.blue.model.Album;
import com.blue.model.Artist;
import com.blue.model.ArtistUser;
import com.blue.model.Concert;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;


@Service("userService")
@Transactional

public class UserServiceImpl implements UserService {
	
	@Autowired
    private UserDAO userdao;
	
	
	public User verifyLogin(String email, String pw) throws Exception {
		return userdao.verifyLogin(email, pw);
	}
	
	@Override
	  public List<Object> findPaymentHistory(int id, String mm, String yyyy) throws Exception{
	   List<Object> list = userdao.findPaymentHistory(id,mm,yyyy);
	   return list;
	   
	  }
	
	@Override
	  public List<Object> findAllPaymentHistory(int id) throws Exception{
	   List<Object> list = userdao.findAllPaymentHistory(id);
	   return list;
	  }
	
	public JSONObject register(User user) throws Exception {
		String email = user.getEmail();
		String nickname = user.getNickname();
		boolean isExistedEmail = userdao.isExistedEmail(email);
		boolean isExistedNickName = userdao.isExistedNickName(nickname);
		
		JSONObject json = new JSONObject();
		if(isExistedEmail) { 
			json.put("email", true);
		}else {
			json.put("email", false);
		}
		if(isExistedNickName) {
			json.put("nickname", true);
		}else {
			json.put("nickname", false);
		}
		json.put("status", false);
		if(!isExistedNickName && !isExistedEmail) {
			try {
				userdao.save(user);		
				json.put("status", true);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return json;
	}
	
	
	public User findById(int id) throws Exception {
		return userdao.findById(id);
	}
	
	
	public Object find(Class entity,int id) throws Exception {
			return userdao.find(entity,id);
	}
	
	@Override
	  public int findUserByNickname(String nickname) throws Exception{
	   int id = userdao.findUserByNickname(nickname);
	   return id;
	  }
	
	
	public void deleteUserByEmail(String email) throws Exception {
			userdao.deleteUserByEmail(email);
	}
	
	
	public void updateUser(User user) throws Exception {
			userdao.update(user);
			
	}
	
	
	public void updatePassword(int id, String password) throws Exception {
		userdao.updatePassword(id, password);
		
	}
	
	//new
	public void saveObject(Object obj) throws Exception{
		userdao.saveObject(obj);
	}

	public List<Album> getAlbums(int number) throws Exception{
		List<Album> albums = userdao.getAlbums(number);
		return albums;
	}
	
	public Album getAlbum(Class type, int id) throws Exception{
		Album al = userdao.getAlbum(type, id);
		return al;
	}


	@Override
	public void deletePlaylist(int id) throws Exception {
		userdao.deletePlaylist(id);
		
	}
	
	@Override
	public void deleteSongInPlaylist(Playlist pl, int id) throws Exception{
		userdao.deleteSongInPlaylist(pl, id);
	}
	
	@Override
	public List<Song> searchSongByName(String name) throws Exception{
		List<Song> songList = userdao.searchSongByName(name);
		return songList;
	}
	
	@Override
	public List<Song> searchSongByType(String type) throws Exception{
		List<Song> songList = userdao.searchSongByType(type);
		return songList;
	}
	
	@Override
	public List<Album> searchAlbumByName(String name) throws Exception{
		List<Album> albumList = userdao.searchAlbumByName(name);
		return albumList;
	}
	
	@Override
	public List<Artist> searchArtistByName(String name) throws Exception{
		List<Artist> artistList = userdao.searchArtistByName(name);
		return artistList;
	}
	
	@Override
	public List<Playlist> searchPlaylistByName(String name) throws Exception{
		List<Playlist> playlistList = userdao.searchPlaylistByName(name);
		return playlistList;
	}
	
	@Override
	public List<Concert> searchConcertByName(String name) throws Exception{
		List<Concert> concertList = userdao.searchConcertByName(name);
		return concertList;
	}
	
	
	@Override
	public void updatePlaylist(Playlist pl) throws Exception{
		userdao.updatePlaylist(pl);
	}
	
	
	@Override
	public List<Playlist> getPlaylists(int number) throws Exception{
		List<Playlist> playList = userdao.getPlaylists(number);
		return playList;
	}
	
	@Override
	public List<Song> getSongs(int number) throws Exception{
		List<Song> songList=userdao.getSongs(number);
		return songList;
	}
	
	@Override
	public List<Artist> getArtists(int number) throws Exception{
		List<Artist> artistList = userdao.getArtists(number);
		return artistList;
	}
	
	@Override
	public User findFriendByNickName(String name) throws Exception{
		User u = userdao.findFriendByNickName(name);
		return u;
	}


	@Override
	public User findUserByEmail(String email) throws Exception{
		User u = userdao.findUserByEmail(email);
		return u;
	}
	
	@Override
	public void deleteUserById(int id) throws Exception{
		userdao.deleteUserById(id);
	}
	
	@Override
	public List<User> getUserAccounts() throws Exception{
		List<User> userList = userdao.getUserAccounts();
		return userList;
	}
	
	@Override
	public List<Song> getSongsByArtist(int id) throws Exception{
		List<Song> songsList = userdao.getSongsByArtist(id);
		return songsList;
	}
	
	@Override
	public long FindTotalSongListener() throws Exception{
		long total = userdao.FindTotalSongListener();
		return total;
	}
	
	@Override
	public long FindTotalPremium() throws Exception{
		long total = userdao.FindTotalPremium();
		return total;
	}
	
	@Override
	public ArtistUser findArtistUser(String email) throws Exception{
		ArtistUser artistuser = userdao.findArtistUser(email);
		return artistuser;
	}
	
	@Override
	public List<Artist> findRelatedArtists(int id) throws Exception{
		List<Artist> relatedArtists = userdao.findRelatedArtists(id);
		return relatedArtists;
	}
	
	@Override
	 public List<User> getAccounts() throws Exception {
	  // TODO Auto-generated method stub
	  return userdao.getAccounts();
	 }


	 @Override
	 public void updatePlayHistory(int user, int song) throws Exception {
	  userdao.updatePlayHistory(user, song);
	 }
	
	
	 @Override
	 public  User updateUserPlaylist(User u) throws Exception{
		 User user=userdao.updateUserPlaylist(u);
		 return user;
	 }

	 @Override
	 public List<Song> findArtistSong(int id) throws Exception{
		 List<Song> songCollection = userdao.findArtistSong(id);
		 return songCollection;
	 }
	 
	 
	 @Override
	 public List<Object> findUserStatic() throws Exception{
		 List<Object> list = userdao.findUserStatic();
		 return list;
	 }
	 
	 @Override
	 public List<Object> findSongStatic() throws Exception{
		 List<Object> list = userdao.findSongStatic();
		 return list;
	 }
	 
	 @Override
	 public List<Object> findArtistStatic() throws Exception{
		 List<Object> list = userdao.findArtistStatic();
		 return list;
	 }
	 
	 
	 @Override
	 public int getSubscriptionfee() throws Exception {
	 	// TODO Auto-generated method stub
	 	return userdao.getSubscriptionfee();
	 }


	 @Override
	 public void updatePayment(int id, String amount, String num) throws Exception {
	 	// TODO Auto-generated method stub
	 	userdao.updatePayment(id, amount, num);
	 }

	@Override
	public void updatePaymentHistory(int user, String amount, String num, String type) throws Exception {
		// TODO Auto-generated method stub
		userdao.updatePaymentHistory(user, amount, num, type);
	}
	
	@Override
	 public long getTotalUserCount() throws Exception{
	  long totaluser = userdao.getTotalUserCount();
	  return totaluser;
	 }
	 
	 @Override
	 public long getTotalArtistCount() throws Exception{
	  long total = userdao.getTotalArtistCount();
	  return total;
	 }
	 
	 @Override
	 public long getTotalSongCount() throws Exception{
	  long total = userdao.getTotalSongCount();
	  return total;
	 }
	 
	 @Override
	 public long getTotalAlbumCount() throws Exception{
	  long total = userdao.getTotalAlbumCount();
	  return total;
	 }
	 
	 @Override
	 public List<Double> getTotalIncome() throws Exception{
	  List<Double> result = userdao.getTotalIncome();
	  return result;
	 }
	
}









//	public boolean findByEmail(String email) throws Exception{
//		String userEmail = userdao.findByEmail(email);
//		return userEmail;
//	}
//	
//	
//	public boolean findByNickName(String nickname) throws Exception{
//		String nn= userdao.findByNickName(nickname);
//		return nn;
//	}
	
	
