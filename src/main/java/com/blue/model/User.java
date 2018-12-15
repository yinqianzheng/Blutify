package com.blue.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "user", catalog = "blue", schema = "", uniqueConstraints = {
	    @UniqueConstraint(columnNames = {"PlayQueueId"})
	    , @UniqueConstraint(columnNames = {"Email"})
	    , @UniqueConstraint(columnNames = {"Nickname"})})
	@XmlRootElement
	@NamedNativeQueries({@NamedNativeQuery(name = "FindUsers", query ="SELECT * FROM User ORDER BY id ", resultClass=User.class)})
	@NamedQueries({
	    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
	    , @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id")
	    , @NamedQuery(name = "User.findByNickname", query = "SELECT u FROM User u WHERE u.nickname = :nickname")
	    , @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email")
	    , @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password")
	    , @NamedQuery(name = "User.findByFirstname", query = "SELECT u FROM User u WHERE u.firstname = :firstname")
	    , @NamedQuery(name = "User.findByLastname", query = "SELECT u FROM User u WHERE u.lastname = :lastname")
	    , @NamedQuery(name = "User.findByType", query = "SELECT u FROM User u WHERE u.type = :type")
	    , @NamedQuery(name = "User.findByImageUrl", query = "SELECT u FROM User u WHERE u.imageUrl = :imageUrl")
	    , @NamedQuery(name = "User.findByBan", query = "SELECT u FROM User u WHERE u.ban = :ban")
	    , @NamedQuery(name = "User.findByExpireDate", query = "SELECT u FROM User u WHERE u.expireDate = :expireDate")
	    , @NamedQuery(name = "User.findByVerificationCode", query = "SELECT u FROM User u WHERE u.verificationCode = :verificationCode")
	    , @NamedQuery(name = "User.findByVerificationStatus", query = "SELECT u FROM User u WHERE u.verificationStatus = :verificationStatus")
	    , @NamedQuery(name = "User.findByVerificationDate", query = "SELECT u FROM User u WHERE u.verificationDate = :verificationDate")})
public class User implements Serializable {
	
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;

    @Basic(optional = false)
    @Column(name = "Nickname", nullable = false, length = 100)
    private String nickname;

    @Basic(optional = false)
    @Column(name = "Email", nullable = false, length = 100)
    private String email;

    @Basic(optional = false)
    @Column(name = "Password", nullable = false, length = 100)
    private String password;

    @Column(name = "Firstname", length = 100)
    private String firstname;
    @Column(name = "Lastname", length = 100)
    private String lastname;
   
    @Column(name = "type", nullable = false, length = 100)
    private String type;
    
    @Column(name = "ImageUrl", length = 1000)
    private String imageUrl;

    @Column(name = "ban", length = 100)
    private String ban;
 
    
    @Column(name = "expireDate")
    @Temporal(TemporalType.DATE)
    private Date expireDate;
    
    @Column(name = "verificationCode", length = 500)
    private String verificationCode;
    @Column(name = "verificationStatus")
    
    private Integer verificationStatus;
    @Column(name = "verificationDate")
    
    @Temporal(TemporalType.DATE)
    private Date verificationDate;
    
    @Column(name = "status")
    private Integer status;

    @Column(name = "privacy")
    private Integer privacy;
    
    @XmlTransient
    public Integer getPrivacy() {
		return privacy;
	}


	public void setPrivacy(Integer privacy) {
		this.privacy = privacy;
	}



	@ManyToMany(fetch=FetchType.EAGER, cascade= {CascadeType.PERSIST,CascadeType.MERGE}, mappedBy = "userCollection")
    @Fetch(FetchMode.SUBSELECT)
    private Collection<Song> songCollection;
	
	@ManyToMany(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,CascadeType.MERGE},mappedBy = "userCollection")
	@Fetch(FetchMode.SUBSELECT)  
	private Collection<Album> albumCollection;

	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy = "ownerId")
	@Fetch(FetchMode.SUBSELECT)  
    private Collection<Playlist> playlistCollection;

    @OneToMany( mappedBy = "userId",cascade=CascadeType.ALL)
    private Collection<Comment> commentCollection;
    @OneToMany( mappedBy = "holderId",cascade=CascadeType.ALL)
    private Collection<CreditCard> creditCardCollection;
    
    @JoinTable(name = "Friends", joinColumns = {
            @JoinColumn(name = "user2Id", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "user1Id", referencedColumnName = "Id", nullable = false)})
    @ManyToMany(fetch=FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    private Collection<User> userCollection;
    
    @ManyToMany(fetch=FetchType.EAGER, mappedBy = "userCollection")
    @Fetch(FetchMode.SUBSELECT)
    private Collection<User> userCollection1;
    
    @ManyToMany(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,CascadeType.MERGE}, mappedBy = "userCollection")
    @Fetch(FetchMode.SUBSELECT)
    private Collection<Artist> artistCollection;
    
//    @ManyToMany(fetch=FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "userCollection")
//    @Fetch(FetchMode.SUBSELECT)
//    private Collection<User> friendCollection;
    
    @JoinColumn(name = "PlayQueueId", referencedColumnName = "Id")
    @OneToOne
    private PlayQueue playQueue;
  
	
	@ManyToMany(fetch=FetchType.EAGER, mappedBy = "userCollection")
	@Fetch(FetchMode.SUBSELECT) 
    private Collection<Playlist> followedPlaylistCollection;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy = "paymentUserId")
	@Fetch(FetchMode.SUBSELECT) 
    private Collection<PaymentHistory> paymentHistoryCollection;
	

	@ManyToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy = "viewerCollection")
	 @Fetch(FetchMode.SUBSELECT)
    private Collection<Song> songHistoriesCollection;
//	@ManyToMany(cascade=CascadeType.ALL, mappedBy = "userCollection")
//    private Collection<Album> savedAlbumCollection;
	
	@OneToMany(fetch=FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "userId")
	@Fetch(FetchMode.SUBSELECT)
    private Collection<PlayHistory> playHistoryCollection;

	

  
    
    public User() {}
    
    
    public User(Integer id) {
        this.id = id;
    }
    
    
    public User(Integer id, String nickname, String email, String password, String type) {
        this.id = id;
        this.nickname = nickname;
        this.email = email;
        this.password = password;
        this.type = type;
    }
    
    
    public User(String nickname, String email, String password, String firstname, String lastname, String type) {
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
	    this.playlistCollection = new ArrayList<Playlist>();
	    this.type=type;
	}
    
    
    public User(String nickname, String email, String password, String firstname, String lastname, String type, String ban) {
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
	    this.playlistCollection = new ArrayList<Playlist>();
	    this.type=type;
	    this.ban=ban;
	}
    
    public User(String nickname, String email, String password, String firstname, String lastname, String type,PlayQueue playQueue, String imageUrl) {
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
	    this.playlistCollection = new ArrayList<Playlist>();
	    this.type=type;
	    this.playQueue=playQueue;
	    this.imageUrl=imageUrl;
	}

    public User(String nickname, String email, String password, String firstname, String lastname, String type,PlayQueue playQueue, String imageUrl,String ban) {
 		this.nickname = nickname;
 		this.email = email;
 		this.password = password;
 		this.firstname = firstname;
 		this.lastname = lastname;
 	    this.playlistCollection = new ArrayList<Playlist>();
 	    this.type=type;
 	    this.playQueue=playQueue;
 	    this.imageUrl=imageUrl;
 	    this.ban=ban;
 	}
 
    public Integer getId() {
        return id;
    }
    

    public void setId(Integer id) {
        this.id = id;
    }


    public String getNickname() {
        return nickname;
    }

    
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    

    public String getEmail() {
        return email;
    }
    

    public void setEmail(String email) {
        this.email = email;
    }
    

    public String getPassword() {
        return password;
    }
    

    public void setPassword(String password) {
        this.password = password;
    }
    

    public String getFirstname() {
        return firstname;
    }
    

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    


    public String getLastname() {
        return lastname;
    }
    

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
 
    public String getType() {
		return type;
	}
    

	public void setType(String type) {
		this.type = type;
	}
	
	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


    @XmlTransient
    public Collection<Song> getSongCollection() {
        return songCollection;
    }
	

    public void setSongCollection(Collection<Song> songCollection) {
        this.songCollection = songCollection;
    }
    

    @XmlTransient
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
    }

    @XmlTransient
    public PlayQueue getPlayQueue() {
        return playQueue;
    }

    public void setPlayQueue(PlayQueue playQueue) {
        this.playQueue = playQueue;
    }
    
    @XmlTransient
    public Collection<PlayHistory> getPlayHistoryCollection() {
		return playHistoryCollection;
	}


	public void setPlayHistoryCollection(Collection<PlayHistory> playHistoryCollection) {
		this.playHistoryCollection = playHistoryCollection;
	}
    
    
    @XmlTransient
    public Collection<Song> getSongHistoriesCollection() {
  	  return songHistoriesCollection;
  	 }
  	 public void setSongHistoriesCollection(Collection<Song> songHistoriesCollection) {
  	  this.songHistoriesCollection = songHistoriesCollection;
  	 }
   

    @XmlTransient
    public Collection<Playlist> getFollowedPlaylistCollection() {
        return followedPlaylistCollection;
    }
    

    public void setFollowedPlaylistCollection(Collection<Playlist> followedPlaylistCollection) {
        this.followedPlaylistCollection = followedPlaylistCollection;
    }
    
    
    @XmlTransient
    public Collection<User> getUserCollection1() {
        return userCollection1;
    }

    public void setUserCollection1(Collection<User> userCollection1) {
        this.userCollection1 = userCollection1;
    }
    

    @XmlTransient
    public Collection<Playlist> getPlaylistCollection() {
        return playlistCollection;
    }

    public void setPlaylistCollection(Collection<Playlist> playlistCollection) {
        this.playlistCollection = playlistCollection;
    }
 
    @XmlTransient
    public Collection<Album> getAlbumCollection() {
        return albumCollection;
    }
    

    public void setAlbumCollection(Collection<Album> albumCollection) {
        this.albumCollection = albumCollection;
    }
    
//    @XmlTransient
//    public Collection<Album> getSavedAlbumCollection() {
//        return savedAlbumCollection;
//    }
//
//    public void setSavedAlbumCollection(Collection<Album> savedAlbumCollection) {
//        this.savedAlbumCollection = savedAlbumCollection;
//    }



    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }
    

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }
    

    @XmlTransient
    public Collection<CreditCard> getCreditCardCollection() {
        return creditCardCollection;
    }

    
    public void setCreditCardCollection(Collection<CreditCard> creditCardCollection) {
        this.creditCardCollection = creditCardCollection;
    }
    
    @XmlTransient
    public Collection<PaymentHistory> getPaymentHistoryCollection() {
        return paymentHistoryCollection;
    }

    public void setPaymentHistoryCollection(Collection<PaymentHistory> paymentHistoryCollection) {
        this.paymentHistoryCollection = paymentHistoryCollection;
    }
    
    
    public String getImageUrl() {
        return imageUrl;
    }

    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public String getBan() {
        return ban;
    }

    public void setBan(String ban) {
        this.ban = ban;
    }
    

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public Integer getVerificationStatus() {
        return verificationStatus;
    }

    public void setVerificationStatus(Integer verificationStatus) {
        this.verificationStatus = verificationStatus;
    }

    public Date getVerificationDate() {
        return verificationDate;
    }

    public void setVerificationDate(Date verificationDate) {
        this.verificationDate = verificationDate;
    }

    @XmlTransient
    public Collection<Artist> getArtistCollection() {
        return artistCollection;
    }

    public void setArtistCollection(Collection<Artist> artistCollection) {
        this.artistCollection = artistCollection;
    }
    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }
    

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) 
        		|| (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    
    @Override
    public String toString() {
        return "entity.User[ id=" + id + " ]";
    }
    
	
	public void createPlaylist(String name, String description, String imageUrl) {
		Playlist playlist = new Playlist(name, description, imageUrl);
		playlist.setCreater(this.nickname);
		playlist.setSongCollection(new ArrayList<Song>());
		playlist.setOwnerId(this);
	    this.playlistCollection.add(playlist);
	}
	
	
    public boolean isExistedPlaylistName(String name) {
		Iterator itr = this.playlistCollection.iterator();
		Playlist pl;
		int counter = 0;
		while(itr.hasNext()) {
			pl = (Playlist)itr.next();
			if (pl.getName().equals(name)) {
				counter++;
			}
		}
		if (counter >= 1)
			return true;
		return false;
    }
    
    
    public Playlist findPlaylistByName(String name) {
		for(Playlist dpl : this.playlistCollection) {
		if(dpl.getName().equals(name)) {
			return dpl;
		}
	}
	return null;
}
    
    public void addFollowedPlaylist(Playlist pl) {
		this.followedPlaylistCollection.add(pl);
	}
    
    public void deleteFollowedPlaylist(Playlist pl) {
		this.followedPlaylistCollection.remove(pl);
	}
    
    public void addFollowedArtist(Artist ar) {
		this.artistCollection.add(ar);
	}
    
    public void deleteFollowedArtist(Artist ar) {
		this.artistCollection.remove(ar);
	}
    
    
    
    
    public void addAlbum(Album al) {
		this.albumCollection.add(al);
	}
    
    
    public void deleteAlbum(Album al) {
		this.albumCollection.remove(al);
		for(Album a: this.albumCollection) {
			print(a.getId());
			print(a.getName());
		}
	}
    
    
    
    protected void print(Object c) {
    		System.out.println(c);
    }
    
    
    
}
