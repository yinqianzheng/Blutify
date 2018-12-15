package com.blue.model;


import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "PlayQueue", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PlayQueue.findAll", query = "SELECT p FROM PlayQueue p")
    , @NamedQuery(name = "PlayQueue.findById", query = "SELECT p FROM PlayQueue p WHERE p.id = :id")
    , @NamedQuery(name = "PlayQueue.findByCapacity", query = "SELECT p FROM PlayQueue p WHERE p.capacity = :capacity")})
public class PlayQueue implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Column(name = "Capacity")
    private Integer capacity;
    @JoinTable(name = "QueueAndSong", joinColumns = {
        @JoinColumn(name = "QueueId", referencedColumnName = "Id", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "SongId", referencedColumnName = "Id", nullable = false)})
    @ManyToMany
    private Collection<Song> songCollection;
    @JoinColumn(name = "CurrentSong", referencedColumnName = "Id")
    @ManyToOne
    private Song currentSong;
    @OneToOne(fetch=FetchType.EAGER, mappedBy = "playQueue")
    private User user;

    public PlayQueue() {
    }

    public PlayQueue(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    @XmlTransient
    public Collection<Song> getSongCollection() {
        return songCollection;
    }

    public void setSongCollection(Collection<Song> songCollection) {
        this.songCollection = songCollection;
    }

    public Song getCurrentSong() {
        return currentSong;
    }

    public void setCurrentSong(Song currentSong) {
        this.currentSong = currentSong;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
        if (!(object instanceof PlayQueue)) {
            return false;
        }
        PlayQueue other = (PlayQueue) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PlayQueue[ id=" + id + " ]";
    }
    
}
