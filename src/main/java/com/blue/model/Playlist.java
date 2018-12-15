package com.blue.model;


import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "playlist", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Playlist.findAll", query = "SELECT p FROM Playlist p")
    , @NamedQuery(name = "Playlist.findById", query = "SELECT p FROM Playlist p WHERE p.id = :id")
    , @NamedQuery(name = "Playlist.findByName", query = "SELECT p FROM Playlist p WHERE p.name = :name")
    , @NamedQuery(name = "Playlist.findByCreatedDate", query = "SELECT p FROM Playlist p WHERE p.createdDate = :createdDate")
    , @NamedQuery(name = "Playlist.findByCreater", query = "SELECT p FROM Playlist p WHERE p.creater = :creater")
    , @NamedQuery(name = "Playlist.findByDescription", query = "SELECT p FROM Playlist p WHERE p.description = :description")
    , @NamedQuery(name = "Playlist.findByNumOfLike", query = "SELECT p FROM Playlist p WHERE p.numOfLike = :numOfLike")
    , @NamedQuery(name = "Playlist.findByImageUrl", query = "SELECT p FROM Playlist p WHERE p.imageUrl = :imageUrl")
    , @NamedQuery(name = "Playlist.findByCapacity", query = "SELECT p FROM Playlist p WHERE p.capacity = :capacity")
    , @NamedQuery(name = "Playlist.findByPublicStatus", query = "SELECT p FROM Playlist p WHERE p.publicStatus = :publicStatus")})
public class Playlist implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "Name", nullable = false, length = 100)
    private String name;
    @Column(name = "CreatedDate")
    @Temporal(TemporalType.DATE)
    private Date createdDate;
    @Column(name = "Creater", length = 100)
    private String creater;
    @Column(name = "Description", length = 2000)
    private String description;
    @Column(name = "NumOfLike")
    private Integer numOfLike;
    @Column(name = "ImageUrl", length = 1000)
    private String imageUrl;
    @Column(name = "Capacity")
    private Integer capacity;
    @Column(name = "publicStatus")
    private Integer publicStatus;
    @JoinTable(name = "PalylistUser", joinColumns = {
        @JoinColumn(name = "FollowedPlaylistId", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "FollowedUserId", referencedColumnName = "Id", nullable = false)})
    @ManyToMany(fetch=FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    private Collection<User> userCollection;
    @ManyToMany(fetch=FetchType.EAGER, cascade= {CascadeType.PERSIST,CascadeType.MERGE}, mappedBy = "playlistCollection")
    @Fetch(FetchMode.SUBSELECT)
    private Collection<Song> songCollection;
    @JoinColumn(name = "OwnerId", referencedColumnName = "Id", nullable = false)
    @ManyToOne(cascade=CascadeType.ALL,optional = false)
    private User ownerId;

    public Playlist() {
    }

    public Playlist(Integer id) {
        this.id = id;
    }

    public Playlist(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

     public Playlist(String name, String description, String imageUrl) {
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
    }
    
    
    public Playlist(String name, String description, String imageUrl, String creater) {
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
        this.creater = creater;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getNumOfLike() {
        return numOfLike;
    }

    public void setNumOfLike(Integer numOfLike) {
        this.numOfLike = numOfLike;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    @XmlTransient
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
    }

    @XmlTransient
    public Collection<Song> getSongCollection() {
        return songCollection;
    }

    public void setSongCollection(Collection<Song> songCollection) {
        this.songCollection = songCollection;
    }

    public User getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(User ownerId) {
        this.ownerId = ownerId;
    }
    
    public Integer getPublicStatus() {
        return publicStatus;
    }

    public void setPublicStatus(Integer publicStatus) {
        this.publicStatus = publicStatus;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Playlist)) {
            return false;
        }
        Playlist other = (Playlist) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Playlist[ id=" + id + " ]";
    }
 
      public void addSong(Song song) {
//    	  	song.getPlaylistCollection().add(this);
    		this.songCollection.add(song);
    }

    
	public void removeSong(int id) {
		Song song = null;
		for(Song s:this.songCollection){
			if(s.getId() == id) {
				song = s;
				break;
			}
		}
		this.songCollection.remove(song);
	}
	
	
	public void addUser(User u) {
		this.userCollection.add(u);
	}
	
	public void deleteUser(User u) {
		this.userCollection.remove(u);
	}
	
	
	
	 
    protected void print(Object c) {
    		System.out.println(c);
    }
    
    
	
	
	
}
