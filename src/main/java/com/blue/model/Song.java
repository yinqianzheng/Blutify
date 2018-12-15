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
@Table(name = "song", catalog = "blue", schema = "")
@XmlRootElement
@NamedNativeQueries({@NamedNativeQuery(name = "FindSongs", query ="SELECT * FROM Song ORDER BY songClickCount DESC LIMIT 30 ", resultClass=Song.class)})
@NamedQueries({
    @NamedQuery(name = "Song.findAll", query = "SELECT s FROM Song s")
    , @NamedQuery(name = "Song.findById", query = "SELECT s FROM Song s WHERE s.id = :id")
    , @NamedQuery(name = "Song.findByName", query = "SELECT s FROM Song s WHERE s.name = :name")
    , @NamedQuery(name = "Song.findByType", query = "SELECT s FROM Song s WHERE s.type = :type")
    , @NamedQuery(name = "Song.findByDescription", query = "SELECT s FROM Song s WHERE s.description = :description")
    , @NamedQuery(name = "Song.findByPublishedDate", query = "SELECT s FROM Song s WHERE s.publishedDate = :publishedDate")
    , @NamedQuery(name = "Song.findByContent", query = "SELECT s FROM Song s WHERE s.content = :content")
    , @NamedQuery(name = "Song.findBySongClickCount", query = "SELECT s FROM Song s WHERE s.songClickCount = :songClickCount")
    , @NamedQuery(name = "Song.findByDuration", query = "SELECT s FROM Song s WHERE s.duration = :duration")
    , @NamedQuery(name = "Song.findByLyrics", query = "SELECT s FROM Song s WHERE s.lyrics = :lyrics")
    , @NamedQuery(name = "Song.findByQuality", query = "SELECT s FROM Song s WHERE s.quality = :quality")
    , @NamedQuery(name = "Song.findByGoodContent", query = "SELECT s FROM Song s WHERE s.goodContent = :goodContent")})
public class Song implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "Name", nullable = false, length = 100)
    private String name;
    @Column(name = "Type", length = 100)
    private String type;
    @Column(name = "Description", length = 2000)
    private String description;
    @Column(name = "publishedDate")
    @Temporal(TemporalType.DATE)
    private Date publishedDate;
    @Column(name = "content", length = 2000)
    private String content;
    @Column(name = "songClickCount")
    private Integer songClickCount;
    @Column(name = "duration", length = 100)
    private String duration;
    @Column(name = "lyrics", length = 10000)
    private String lyrics;
    @Column(name = "quality", length = 100)
    private String quality;
    @Column(name = "goodContent", length = 2000)
    private String goodContent;
    @JoinTable(name = "songUser", joinColumns = {
            @JoinColumn(name = "songId", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "userId", referencedColumnName = "Id", nullable = false)})
        @ManyToMany(fetch=FetchType.EAGER, cascade= {CascadeType.PERSIST,CascadeType.MERGE})
        @Fetch(FetchMode.SUBSELECT)
        private Collection<User> userCollection;
    @JoinTable(name = "playlistSong", joinColumns = {
        @JoinColumn(name = "songId", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "plId", referencedColumnName = "Id", nullable = false)})
    @ManyToMany(fetch=FetchType.EAGER, cascade= {CascadeType.PERSIST,CascadeType.MERGE})
    @Fetch(FetchMode.SUBSELECT)
    private Collection<Playlist> playlistCollection;
    @JoinColumn(name = "songAlbumId", referencedColumnName = "Id")
    @ManyToOne
    private Album songAlbumId;
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "songCollection")
    private Collection<PlayQueue> playQueueCollection;
    @JoinColumn(name = "ArtistId", referencedColumnName = "Id", nullable = false)
    @ManyToOne(optional = false)
    private Artist artistId;
    @OneToMany(fetch=FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "currentSong")
    private Collection<PlayQueue> playQueueCollection1;
   
    @Column(name = "income", length = 100)
    private String income;
    
    @JoinTable(name = "playHistory", joinColumns = {
            @JoinColumn(name = "songId", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "userId", referencedColumnName = "Id", nullable = false)})
    @ManyToMany(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
    private Collection<User> viewerCollection;
    
    
    @Column(name = "monthClickCount")
    private Integer monthClickCount;
    @XmlTransient
    public Integer getMonthClickCount() {
	  return monthClickCount;
	 }
	
	 public void setMonthClickCount(Integer monthClickCount) {
	  this.monthClickCount = monthClickCount;
	 }
    
    
    public Song() {
    }

    public Song(Integer id) {
        this.id = id;
    }

    public Song(Integer id, String name) {
        this.id = id;
        this.name = name;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(Date publishedDate) {
        this.publishedDate = publishedDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getSongClickCount() {
        return songClickCount;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }


	public void setSongClickCount(Integer songClickCount) {
        this.songClickCount = songClickCount;
    }
    

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getLyrics() {
        return lyrics;
    }

    public void setLyrics(String lyrics) {
        this.lyrics = lyrics;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public String getGoodContent() {
        return goodContent;
    }

    public void setGoodContent(String goodContent) {
        this.goodContent = goodContent;
    }


    @XmlTransient
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
    }

    @XmlTransient
    public Collection<Playlist> getPlaylistCollection() {
        return playlistCollection;
    }

    public void setPlaylistCollection(Collection<Playlist> playlistCollection) {
        this.playlistCollection = playlistCollection;
    }

    public Album getSongAlbumId() {
        return songAlbumId;
    }

    public void setSongAlbumId(Album songAlbumId) {
        this.songAlbumId = songAlbumId;
    }

    @XmlTransient
    public Collection<PlayQueue> getPlayQueueCollection() {
        return playQueueCollection;
    }

    public void setPlayQueueCollection(Collection<PlayQueue> playQueueCollection) {
        this.playQueueCollection = playQueueCollection;
    }

    public Artist getArtistId() {
        return artistId;
    }

    public void setArtistId(Artist artistId) {
        this.artistId = artistId;
    }
    
    
    @XmlTransient
    public Collection<User> getViewerCollection() {
	  return viewerCollection;
	 }
	
	 public void setViewerCollection(Collection<User> viewerCollection) {
	  this.viewerCollection = viewerCollection;
	 }

	 
    @XmlTransient
    public Collection<PlayQueue> getPlayQueueCollection1() {
        return playQueueCollection1;
    }

    public void setPlayQueueCollection1(Collection<PlayQueue> playQueueCollection1) {
        this.playQueueCollection1 = playQueueCollection1;
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
        if (!(object instanceof Song)) {
            return false;
        }
        Song other = (Song) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Song[ id=" + id + " ]";
    }
    
}
