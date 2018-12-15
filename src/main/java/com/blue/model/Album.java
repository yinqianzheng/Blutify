package com.blue.model;


import java.io.Serializable;
import java.util.ArrayList;
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
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.json.JSONObject;

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "album", catalog = "blue", schema = "")
@XmlRootElement
@NamedNativeQueries({@NamedNativeQuery(name = "FindAlbums", query ="SELECT * FROM Album ORDER BY id DESC LIMIT 20", resultClass=Album.class)})
@NamedQueries({
    @NamedQuery(name = "Album.findAll", query = "SELECT a FROM Album a")
    , @NamedQuery(name = "Album.findById", query = "SELECT a FROM Album a WHERE a.id = :id")
    , @NamedQuery(name = "Album.findByName", query = "SELECT a FROM Album a WHERE a.name = :name")
    , @NamedQuery(name = "Album.findByCreatedTime", query = "SELECT a FROM Album a WHERE a.createdTime = :createdTime")
    , @NamedQuery(name = "Album.findByNumOfLike", query = "SELECT a FROM Album a WHERE a.numOfLike = :numOfLike")
    , @NamedQuery(name = "Album.findByDescription", query = "SELECT a FROM Album a WHERE a.description = :description")
    , @NamedQuery(name = "Album.findByImageUrl", query = "SELECT a FROM Album a WHERE a.imageUrl = :imageUrl")
    , @NamedQuery(name = "Album.findByCapacity", query = "SELECT a FROM Album a WHERE a.capacity = :capacity")
    , @NamedQuery(name = "Album.findByClickCount", query = "SELECT a FROM Album a WHERE a.clickCount = :clickCount")
    , @NamedQuery(name = "Album.findByType", query = "SELECT a FROM Album a WHERE a.type = :type")})
public class Album implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Column(name = "Name", length = 100)
    private String name;
    @Column(name = "CreatedTime")
    @Temporal(TemporalType.DATE)
    private Date createdTime;
    @Column(name = "NumOfLike")
    private Integer numOfLike;
    @Column(name = "Description", length = 2000)
    private String description;
    @Column(name = "ImageUrl", length = 1000)
    private String imageUrl;
    @Column(name = "Capacity")
    private Integer capacity;
    @Column(name = "ClickCount")
    private Integer clickCount;
    @Column(name = "type", length = 45)
    private String type;
    @JoinTable(name = "albumUser", joinColumns = {
            @JoinColumn(name = "SavedAlbumId", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "SavedUserId", referencedColumnName = "Id", nullable = false)})
        @ManyToMany(fetch=FetchType.EAGER, cascade= {CascadeType.PERSIST,CascadeType.MERGE})
        @Fetch(FetchMode.SUBSELECT)
        private Collection<User> userCollection;

    @OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL, mappedBy = "songAlbumId")
    @Fetch(FetchMode.SUBSELECT)
    private Collection<Song> songCollection;
    @JoinColumn(name = "AlbumArtistId", referencedColumnName = "Id")
    @ManyToOne(cascade=CascadeType.ALL)
    private Artist albumArtistId;
    
    
    
    public Album() {
    }

    public Album(Integer id) {
        this.id = id;
    }
    
     public Album(String name, int numOfLike, String description, int capacity) {
    		this.name=name;
    		this.numOfLike=numOfLike;
    		this.description=description;
    		this.capacity=capacity;    	
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

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Integer getNumOfLike() {
        return numOfLike;
    }

    public void setNumOfLike(Integer numOfLike) {
        this.numOfLike = numOfLike;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public Artist getArtistId() {
        return albumArtistId;
    }

    public void setArtistId(Artist artistId) {
        this.albumArtistId = artistId;
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
        if (!(object instanceof Album)) {
            return false;
        }
        Album other = (Album) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Album[ id=" + id + " ]";
    }

    
    public void addUser(User u) {
    		this.userCollection.add(u);
    }
    
    public void deleteUser(User u) {
		this.userCollection.remove(u);
    }
}
