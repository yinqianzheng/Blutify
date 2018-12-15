package com.blue.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "playHistory", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PlayHistory.findAll", query = "SELECT p FROM PlayHistory p")
    , @NamedQuery(name = "PlayHistory.findById", query = "SELECT p FROM PlayHistory p WHERE p.id = :id")
    , @NamedQuery(name = "PlayHistory.findByDate", query = "SELECT p FROM PlayHistory p WHERE p.date = :date")})
public class PlayHistory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @JoinColumn(name = "userId", referencedColumnName = "Id", nullable = false)
    @ManyToOne(optional = false)
    private User userId;
    @JoinColumn(name = "songId", referencedColumnName = "Id", nullable = false)
    @ManyToOne(optional = false)
    private Song songId;

    public PlayHistory() {
    }

    public PlayHistory(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Song getSongId() {
        return songId;
    }

    public void setSongId(Song songId) {
        this.songId = songId;
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
        if (!(object instanceof PlayHistory)) {
            return false;
        }
        PlayHistory other = (PlayHistory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PlayHistory[ id=" + id + " ]";
    }
    
}
