package com.blue.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.json.JSONObject;

import com.blue.model.Album;
import com.blue.model.Artist;
import com.blue.model.ArtistUser;
import com.blue.model.Concert;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;

public interface UserDAO {
	int getSubscriptionfee() throws Exception;
	User verifyLogin (String email, String pw) throws Exception;
	void save(User user) throws Exception;
	User findById(int id) throws Exception;
	boolean isExistedEmail(String email) throws Exception;
	boolean isExistedNickName(String nickName) throws Exception;
	Object find(Class entity, int id) throws Exception;
	void deleteUserByEmail(String email) throws Exception;
	void update(User user) throws Exception ;
	void updatePassword(int id, String password) throws Exception;
	void saveObject(Object obj) throws Exception;

	Album getAlbum(Class type, int id) throws Exception;
	void deletePlaylist(int id) throws Exception;
	void deleteSongInPlaylist(Playlist pl, int id) throws Exception;
	List<Song> searchSongByName(String name) throws Exception;
	List<Song> searchSongByType(String type) throws Exception;
	List<Album> searchAlbumByName(String name) throws Exception;
	List<Artist> searchArtistByName(String name) throws Exception;
	List<Playlist> searchPlaylistByName(String name) throws Exception;
	List<Concert> searchConcertByName(String name) throws Exception;

	void updatePlaylist(Playlist pl) throws Exception;
	
	List<Album> getAlbums(int number) throws Exception;
	List<Playlist> getPlaylists(int number) throws Exception;
	List<Song> getSongs(int number) throws Exception;
	List<Artist> getArtists(int number) throws Exception;
	
	User findFriendByNickName(String name) throws Exception;
	User findUserByEmail(String email) throws Exception;
	void deleteUserById(int id) throws Exception;
	
	List<User> getUserAccounts() throws Exception;
	List<Song> getSongsByArtist(int id) throws Exception;
	long FindTotalSongListener() throws Exception;
	long FindTotalPremium() throws Exception;
	ArtistUser findArtistUser(String email) throws Exception;
	List<Artist> findRelatedArtists(int id) throws Exception;
	
	
	void updatePlayHistory(int user, int song) throws Exception;
	 List<User> getAccounts() throws Exception;
	void updatePayment(int id, String amount, String num) throws Exception;
	User updateUserPlaylist(User u) throws Exception;
	List<Song> findArtistSong(int id) throws Exception;
	List<Object> findUserStatic() throws Exception;
	List<Object> findSongStatic() throws Exception;
	List<Object> findArtistStatic() throws Exception;
	int findUserByNickname(String nickname) throws Exception;
	List<Object> findPaymentHistory(int id, String mm, String yyyy) throws Exception;
	void updatePaymentHistory(int user, String amount, String num, String type) throws Exception;
	List<Object> findAllPaymentHistory(int id) throws Exception;
	long getTotalSongCount() throws Exception;
	long getTotalArtistCount() throws Exception;
	long getTotalAlbumCount() throws Exception;
	List<Double> getTotalIncome() throws Exception;
	long getTotalUserCount() throws Exception;
	
	
}

