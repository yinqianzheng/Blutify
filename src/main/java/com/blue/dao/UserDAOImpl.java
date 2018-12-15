package com.blue.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blue.model.Album;
import com.blue.model.Artist;
import com.blue.model.ArtistUser;
import com.blue.model.Concert;
import com.blue.model.PaymentHistory;
import com.blue.model.Playlist;
import com.blue.model.Song;
import com.blue.model.User;
import com.mysql.jdbc.Statement;



@Repository("uerDAO")
public class UserDAOImpl extends AbstractDAO<Integer, User> implements UserDAO{
	
	
	@SuppressWarnings("unchecked")
	public User verifyLogin(String email, String pw)throws Exception {
		String hql = "select u from User u where u.email='" 
				+ email 
				+ "' and u.password='" 
				+ pw
				+ "'";
//		Session session = this.getSession();
		Query query = this.getSession().createQuery(hql);
		List<User> user = query.list();
		if(user.size()==0 || user.isEmpty()) {
			return null;
		}
		return user.get(0);
	}
	
	
	@Override
	  public List<Object> findAllPaymentHistory(int id) throws Exception{
	   String hql = "select  u.nickname, p.paymentDate, p.paymentAmount, p.creditNumber,p.paymenttype from "+PaymentHistory.class.getName()
	     +" p, "+User.class.getName()+" u where (paymentUserId = '"+id+"') and (p.paymentUserId = u.id)";
	   Query qry = this.getSession().createQuery(hql);
	   List<Object> result = qry.list();
	   return result;
	  }
	
	@Override
	  public List<Object> findPaymentHistory(int id, String mm, String yyyy) throws Exception{
	   String hql = "select  u.nickname, p.paymentDate, p.paymentAmount, p.creditNumber, p.paymenttype from "+PaymentHistory.class.getName()
	     +" p, "+User.class.getName()+" u where (DATE_FORMAT(paymentDate, \'%m\') = "+mm+" and DATE_FORMAT(paymentDate, \'%Y\') = "+yyyy+" ) and paymentUserId = '"+id+"' and (p.paymentUserId = u.id)";
	   Query qry = this.getSession().createQuery(hql);
	   List<Object> result = qry.list();
	   return result;
	  }
	
	@Override
	public void deletePlaylist(int id) throws Exception {
			   Query query = getSession().createSQLQuery("delete from Playlist where id = :id");
			    query.setInteger("id", id);
			    query.executeUpdate();
	}
	
	public Object find(Class type, int id) throws Exception{
			Object tmp=this.getSession().get(type, id);	
			print(tmp);
			return tmp;
	}
	
	@Override
	  public int findUserByNickname(String nickname) throws Exception{
	   String hql = "select u from User u where u.nickname = '"+nickname+"'";
	   Query qry = this.getSession().createQuery(hql);
	   List<User> list = qry.list();
	   if(list.size()==0) {
	    return -1;
	   }else {
	    User u = list.get(0);
	    int id = u.getId();
	    return id;
	   }
	  }
	
	@Override
	public void save(User user) throws Exception {
			persist(user);
	}
	
	
	@Override
	public void deleteUserByEmail(String email) throws Exception {
			   Query query = getSession().createSQLQuery("delete from User where email = :email");
			    query.setString("email", email);
			    query.executeUpdate();
	}
	
	
	@Override
	public User findById(int id) throws Exception {
		  return getByKey(id);
	}
	
	
	public boolean isExistedEmail(String email){
		String hql="select u from User u where u.email='"+email+"'";
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		List<User> user = query.list();
		if(user.size()==0 || user.isEmpty()) {
			return false;
		}
		return true;
	}
	
	
	public boolean isExistedNickName(String nickname) throws Exception{
		String hql="select u from User u where u.nickname='"+nickname+"'";
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		List<User> user = query.list();
		if(user.size()==0 || user.isEmpty()) {
			return false;
		}
		return true;
	}


	@Override
	public void update(User user) throws Exception {
		this.getSession().saveOrUpdate(user);
		
	}
	

	public void updatePassword(int id, String password) throws Exception{
		String hql="update user set password='"+password+"' where id='"+id+"'";
		Query query = this.getSession().createQuery(hql);
		System.out.println(query);
	}
	
	//new 
	@Override
	public void saveObject(Object obj) throws Exception{
		this.getSession().saveOrUpdate(obj);
	}
	
	@Override
	 public List<Album> getAlbums(int number) throws Exception{
	  Query qry = this.getSession().getNamedQuery("FindAlbums");
	  List<Album> albums=qry.list();
	  return albums;
	 }
	
	@Override
	public Album getAlbum(Class type, int id) throws Exception{
		Album al=(Album) this.getSession().get(type, id);	
		List<Song> s= (List<Song>) al.getSongCollection();
		Set<Song> ns = new LinkedHashSet<>(s);
		al.setSongCollection(ns);
		return al;
	}
	
	@Override
	public void deleteSongInPlaylist(Playlist pl, int id) throws Exception{
		int plid = pl.getId();
//		String sql = "delete s from PlaylistSong where SongId ='"+ id +"' and plId ='" + plid +"'";
//		Query query = this.getSession().createQuery(sql);
//		
		Query query = getSession().createSQLQuery("delete from PlaylistSong where Songid = :id and plId = :plid");
	    query.setInteger("id", id);
	    query.setInteger("plid", plid);
	    query.executeUpdate();
		print("delete song from pl finished");
	}
	
	@Override
	public List<Song> searchSongByName(String name) throws Exception{
		String sql = "select s from Song s where name Like '%"+ name +"%'";
		print(sql);
		Query query = this.getSession().createQuery(sql);
		List<Song> songList = query.list();
		print("searchSongByName");
//		for(Song s:songList) {
//			print(s.getName());
//			print(s.getId());
//		}
		return songList;
	}
	
	public List<Song> searchSongByType(String type) throws Exception{
		String sql = "select s from Song s where type Like '%"+ type +"%'";
		print(sql);
		Query query = this.getSession().createQuery(sql);
		List<Song> songList = query.list();
		print("searchSongByType");
//		for(Song s:songList) {
//			print(s.getType());
//			print(s.getName());
//		}
		return songList;
	}
	
	
	public List<Album> searchAlbumByName(String name) throws Exception{


		String sql="select a from Album a where name Like '%"+ name +"%'";
		Query qry = this.getSession().createQuery(sql);
		List<Album> albumList = qry.list();
		print("searchAlbumByName");
		return albumList;
	}
	
	public List<Artist> searchArtistByName(String name) throws Exception{
		String sql="select a from Artist a where name Like '%"+ name +"%'";
		Query qry = this.getSession().createQuery(sql);
		List<Artist> artistList = qry.list();
		print("searchArtistByName");
//		for(Artist a: artistList) {
//			print(a.getName());
//		}
		return artistList;
	}
	
	public List<Playlist> searchPlaylistByName(String name) throws Exception{
		String sql="select a from Playlist a where name Like '%"+ name +"%' and PublicStatus ='"+ 1 +"'";
		Query qry = this.getSession().createQuery(sql);
		List<Playlist> playlistList = qry.list();
		print("searchPlaylistByName");
//		for(Playlist a:playlistList) {
//			print(a.getName());
//			print(a.getId());
//		}
		return playlistList;
	}
	
	public List<Concert> searchConcertByName(String name) throws Exception{
		String sql="select a from Concert a where name Like '%"+ name +"%'";
		Query qry = this.getSession().createQuery(sql);
		List<Concert> concertList = qry.list();
		print("searchConcertByName");
//		for(Concert a:concertList) {
//			print(a.getName());
//			print(a.getId());
//		}
		return concertList;
	}
	
	
	public void updatePlaylist(Playlist pl) throws Exception{
		print("updatePlaylist");
		int id=pl.getId();
		String hql="update Playlist p set p.id='"+id+"'";
		Query qry=this.getSession().createQuery(hql);
//		this.getSession().saveOrUpdate(pl);
		print("success");
	}
	
	
	@Override
	public List<Playlist> getPlaylists(int number) throws Exception{
		List<Playlist> playlists = this.getSession().createCriteria(Playlist.class).list();
		Query query = this.getSession().createQuery(
			    "FROM Playlist where publicStatus = '1'"
				).setMaxResults(number);
		playlists = query.list();
		for(Playlist p: playlists) {
		List<Song> s= (List<Song>) p.getSongCollection();
		Set<Song> ns = new LinkedHashSet<>(s);
		p.setSongCollection(ns);
		}
		return playlists;
	}
	
	@Override
	public List<Song> getSongs(int number) throws Exception{
		Query query = this.getSession().getNamedQuery("FindSongs");
	
		List<Song> songlists=query.list();
		return songlists;
	}
	
	
	@Override
	public List<Artist> getArtists(int number) throws Exception{
		Query query = this.getSession().getNamedQuery("FindArtists");
		List<Artist> artistlists=query.list();
		return artistlists;
	}

	
	@Override
	public User findFriendByNickName(String name) throws Exception{
		Query query = this.getSession().createQuery("select u From User u where u.nickname = '"+name+"'");
		List<User> user = query.list();
		if(user.size()==0) {
			return null;
		}
		return user.get(0);
	}
	
	
	@Override
	public User findUserByEmail(String email) throws Exception{
		Query query = this.getSession().createQuery("select u From User u where u.email = '"+email+"'");
		List<User> user = query.list();
		if(user.size()==0) {
			return null;
		}
		return user.get(0);
	}
	
	@Override
	public void deleteUserById(int id) throws Exception{
		Query query = this.getSession().createSQLQuery("delete from User where id = :id");
	    query.setInteger("id", id);
	    query.executeUpdate();
	}
	
	
	@Override
	public List<User> getUserAccounts() throws Exception{
		Query query = this.getSession().createQuery("select * from User");
		List<User> users = query.list();
		if(users.size()==0) {
			return null;
		}
		print(users.size());
		return users;
	}
	
	@Override
	public List<Song> getSongsByArtist(int id) throws Exception{
		Query query = this.getSession().createQuery("select s from Song s where s.ArtistId = '"+id+"'");
		List<Song> songLists=query.list();
		if(songLists.size()==0) {
			return null;
		}
		print(songLists.size());
		return songLists;	
	}

	@Override
	public long FindTotalSongListener() throws Exception{
		String hql= "Select sum(songClickCount) From Song s";
		Query query = this.getSession().createQuery(hql);
		List count=query.list();
		long total = (long) count.get(0);
		print(count.get(0));
		print("findtotalsonglistener");
		return total;
	}
	
	@Override
	public long FindTotalPremium() throws Exception{
		String hql="Select u From User u where u.type = 'premium'";
		Query query = this.getSession().createQuery(hql);
		List<User> user = query.list();
		String hql2="Select f.fee from Subscriptionfee f where f.id = '1'";
		Query query2 = this.getSession().createQuery(hql2);
		List totalIncome = query2.list();
		print(totalIncome.get(0));
		int total = (int)totalIncome.get(0)*user.size();
		print(user.size());
		print(total);
		print("findtotalpremium done");
		return total;
	}
	
	@Override
	public ArtistUser findArtistUser(String email) {
		String hql = "Select a From ArtistUser a where a.email = '"+email+"'";
		Query query = this.getSession().createQuery(hql);
		List<ArtistUser> list = query.list();
		ArtistUser artistUser = list.get(0); 
		return artistUser;
	}
	
	@Override
	public List<Artist> findRelatedArtists(int id){
		Query qry = this.getSession().createQuery("select a from Artist a where a.id in( (select s1.artistId from Song s1 where s1.type in (select s.type from Song s where s.artistId = :id group by s.type) group by s1.artistId))");
		qry.setInteger("id", id);
		List<Artist> relatedArtists = qry.list();
		print("relatedArtists " + relatedArtists.size());
		return relatedArtists;
	}
	
	
	public List<User> getAccounts() throws Exception {
		Query query = this.getSession().getNamedQuery("FindUsers");
		  List<User> accounts = query.list();
		  return accounts;
		 }

	 @Override
	 public void updatePlayHistory(int user, int song) throws Exception {
	  // TODO Auto-generated method stub
	  Query query = getSession().createSQLQuery("insert into playHistory (userId, songId) values (:userId, :songId)");
	     query.setInteger("userId", user);
	     query.setInteger("songId", song);
	     query.executeUpdate();
	 }
	 
	 
	 @Override
	 public void updatePaymentHistory(int user, String amount, String num, String type) throws Exception {
		  // TODO Auto-generated method stub
		  Query query = getSession().createSQLQuery("insert into paymentHistory (PaymentUserId, paymentAmount, creditNumber, paymenttype) values (:userId, :amount, :num, :type)");
		     query.setInteger("userId", user);
		     query.setString("amount", amount);
		     query.setString("num", num);
		     query.setString("type", type);
		     query.executeUpdate();
	 }
	
	 
	 
	 @Override
	 public List<Song> findArtistSong(int id) throws Exception{
		 String hql = "select s from Song s where s.artistId = '"+id+"'";
		 Query query = this.getSession().createQuery(hql);
		 List<Song> songCollection = query.list();
		 print(songCollection.size());
		 return songCollection;
	 }
		 
	 
	 
	 @Override
	 public List<Object> findUserStatic() throws Exception{
		 String hql = "select u.type, count(u.type) from "+ User.class.getName()+" u group by u.type";
		 Query qry = this.getSession().createQuery(hql);
		 List<Object> list = qry.list();
		 return list;
	 }
	 
	 
	 @Override
	  public List<Object> findSongStatic() throws Exception{
	   String hql = "SELECT s.type, sum(s.songClickCount) from "+Song.class.getName()+" s group by s.type order by count(s.type) DESC";
	   Query qry = this.getSession().createQuery(hql).setMaxResults(5);
	   List<Object> list = qry.list();
	   return list;
	   
	  }
	 
	 @Override
	 public List<Object> findArtistStatic() throws Exception{
		 String hql = "select a.name, sum(s.songClickCount) as playedCount from "+Song.class.getName()+" s, "+Artist.class.getName()+" a where a.id = s.artistId"
		 		+ " GROUP BY s.artistId order by playedCount desc ";
		 Query qry = this.getSession().createQuery(hql).setMaxResults(3);
		 List<Object> list = qry.list();
		 return list;
	 }
	
	 
	 @Override
	 public int getSubscriptionfee() throws Exception {
		  Query query = this.getSession().createQuery("Select f.fee from Subscriptionfee f where f.id = '1'");
		  List fee = query.list();
		  return (int) fee.get(0);
	 }
	 
	 @Override
	 public void updatePayment(int id, String amount, String num) throws Exception {
	   Query query = getSession().createSQLQuery("insert into paymentHistory (PaymentUserId, paymentAmount, creditNumber) values (:userId, :amount, :number)");
	      query.setInteger("userId", id);
	      query.setString("amount", amount);
	      query.setString("number", num);
	      query.executeUpdate();
	 }
	 
	 @Override
	  public  User updateUserPlaylist(User u) throws Exception{
	   User user = (User) this.getSession().merge(u);
	   return user;
	  }
	
	protected void print(Object c) {
		System.out.println(c);
	}
	
	@Override
	  public long getTotalUserCount() throws Exception{
	   String hql = "select count(u.id) from User u";
	   Query qry = this.getSession().createQuery(hql);
	   List<Object>  a = qry.list();
	   long total =   (long) a.get(0);
	   return total;
	  }
	  
	  @Override
	  public long getTotalArtistCount() throws Exception{
	   String hql = "select count(a.id) from Artist a";
	   Query qry = this.getSession().createQuery(hql);
	   List<Object>  a = qry.list();
	   long total =   (long) a.get(0);
	   return total;
	  }
	  
	  @Override
	  public long getTotalSongCount() throws Exception{
	   String hql = "select count(a.id) from Song a";
	   Query qry = this.getSession().createQuery(hql);
	   List<Object>  a = qry.list();
	   long total =   (long) a.get(0);
	   return total;
	  }
	  
	  @Override
	  public long getTotalAlbumCount() throws Exception{
	   String hql = "select count(s.id) from Album s";
	   Query qry = this.getSession().createQuery(hql);
	   List<Object>  a = qry.list();
	   long total =   (long) a.get(0);
	   return total;
	  }
	  
	  
	  @Override
	  public List<Double> getTotalIncome() throws Exception{
	   String hql="select p.paymentAmount from PaymentHistory p";
	   Query qry = this.getSession().createQuery(hql);
	   List<String> list = qry.list();
	   List<String> newlist = new ArrayList<String>();
	   for(String s: list) {
	    String news=s.replaceAll("[^A-Za-z0-9.]","");
	    print(news);
	    newlist.add(news);
	   }
	   List<Double> result = new ArrayList<Double>();
	   for(String s: newlist) {
	    result.add(Double.valueOf(s));
	   }
	   return result;
	  }
}

