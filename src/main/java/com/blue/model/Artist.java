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

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "artist", catalog = "blue", schema = "")
@XmlRootElement
@NamedNativeQueries({@NamedNativeQuery(name = "FindArtists", query ="SELECT * FROM Artist ORDER BY id DESC LIMIT 16 ", resultClass=Artist.class)})
@NamedQueries({
    @NamedQuery(name = "Artist.findAll", query = "SELECT a FROM Artist a")
    , @NamedQuery(name = "Artist.findById", query = "SELECT a FROM Artist a WHERE a.id = :id")
    , @NamedQuery(name = "Artist.findByName", query = "SELECT a FROM Artist a WHERE a.name = :name")
    , @NamedQuery(name = "Artist.findByBirthDay", query = "SELECT a FROM Artist a WHERE a.birthDay = :birthDay")
    , @NamedQuery(name = "Artist.findByBiography", query = "SELECT a FROM Artist a WHERE a.biography = :biography")
    , @NamedQuery(name = "Artist.findByImageUrl", query = "SELECT a FROM Artist a WHERE a.imageUrl = :imageUrl")
    , @NamedQuery(name = "Artist.findBySalary", query = "SELECT a FROM Artist a WHERE a.salary = :salary")
    , @NamedQuery(name = "Artist.findByType", query = "SELECT a FROM Artist a WHERE a.type = :type")
    , @NamedQuery(name = "Artist.findByTotalSongs", query = "SELECT a FROM Artist a WHERE a.totalSongs = :totalSongs")})
public class Artist implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Column(name = "Name", length = 100)
    private String name;
    @Column(name = "BirthDay")
    @Temporal(TemporalType.DATE)
    private Date birthDay;
    @Column(name = "Biography", length = 2000)
    private String biography;
    @Column(name = "ImageUrl", length = 1000)
    private String imageUrl;
    @Column(name = "Salary")
    private Integer salary;
    @Column(name = "type", length = 100)
    private String type;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "artistId")
    @Fetch(FetchMode.SUBSELECT)
    private Collection<Song> songCollection;
    @OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "albumArtistId")
    @Fetch(FetchMode.SUBSELECT)
    private Collection<Album> albumCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "requestArtistId")
    private Collection<Request> requestCollection;
 
    @OneToMany(mappedBy = "albumArtistId")
    private Collection<Album> albumCollection1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "artist")
    private Collection<Concert> concertCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "artistInfoId")
    private Collection<ArtistUser> artistUserCollection;
   
    @JoinTable(name = "artistUserFollow", joinColumns = {
            @JoinColumn(name = "artistFollowId", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "userFollowId", referencedColumnName = "Id", nullable = false)})
    @ManyToMany(fetch=FetchType.EAGER,cascade= {CascadeType.PERSIST,CascadeType.MERGE})
    @Fetch(FetchMode.SUBSELECT)
    private Collection<User> userCollection;
    
    @Column(name = "totalSongs", length = 100)
    private String totalSongs;
    
    @Column(name = "totalListeners", length = 100)
    private String totalListeners;
    

	public Artist() {
    }

    public Artist(Integer id) {
        this.id = id;
    }

     public Artist(String name, String biography, String imageUrl) {
    		 this.name=name;
    		 this.biography=biography;
    		 this.imageUrl=imageUrl;
    }
     
     public Artist(Integer id, String name, String biography, String imageUrl) {
	 	 this.id=id;
		 this.name=name;
		 this.biography=biography;
		 this.imageUrl=imageUrl;
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

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    
    
    @XmlTransient
    public Collection<Song> getSongCollection() {
        return songCollection;
    }

    public void setSongCollection(Collection<Song> songCollection) {
        this.songCollection = songCollection;
    }

    @XmlTransient
    public Collection<Album> getAlbumCollection() {
        return albumCollection;
    }

    public void setAlbumCollection(Collection<Album> albumCollection) {
        this.albumCollection = albumCollection;
    }
    
    @XmlTransient
    public Collection<Request> getRequestCollection() {
        return requestCollection;
    }

    public void setRequestCollection(Collection<Request> requestCollection) {
        this.requestCollection = requestCollection;
    }
    
    @XmlTransient
    public Collection<Album> getAlbumCollection1() {
        return albumCollection1;
    }

    public void setAlbumCollection1(Collection<Album> albumCollection1) {
        this.albumCollection1 = albumCollection1;
    }
    
    @XmlTransient
    public Collection<Concert> getConcertCollection() {
        return concertCollection;
    }

    public void setConcertCollection(Collection<Concert> concertCollection) {
        this.concertCollection = concertCollection;
    }

    

	public String getTotalListeners() {
		return totalListeners;
	}

	public void setTotalListeners(String totalListeners) {
		this.totalListeners = totalListeners;
	}
	
	
    @XmlTransient
    public Collection<ArtistUser> getArtistUserCollection() {
        return artistUserCollection;
    }

    public void setArtistUserCollection(Collection<ArtistUser> artistUserCollection) {
        this.artistUserCollection = artistUserCollection;
    }

    public String getTotalSongs() {
		return totalSongs;
	}

	public void setTotalSongs(String totalSongs) {
		this.totalSongs = totalSongs;
	}


    @XmlTransient
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
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
        if (!(object instanceof Artist)) {
            return false;
        }
        Artist other = (Artist) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Artist[ id=" + id + " ]";
    }
    
    public void addUser(User u) {
		this.userCollection.add(u);
	}
	
	public void deleteUser(User u) {
		this.userCollection.remove(u);
	}
    
    
    
    
}
