package com.blue.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "concert", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Concert.findAll", query = "SELECT c FROM Concert c")
    , @NamedQuery(name = "Concert.findById", query = "SELECT c FROM Concert c WHERE c.id = :id")
    , @NamedQuery(name = "Concert.findByTime", query = "SELECT c FROM Concert c WHERE c.time = :time")
    , @NamedQuery(name = "Concert.findByLocation", query = "SELECT c FROM Concert c WHERE c.location = :location")
    , @NamedQuery(name = "Concert.findByDescription", query = "SELECT c FROM Concert c WHERE c.description = :description")
    , @NamedQuery(name = "Concert.findByPrice", query = "SELECT c FROM Concert c WHERE c.price = :price")
    , @NamedQuery(name = "Concert.findByName", query = "SELECT c FROM Concert c WHERE c.name = :name")})
public class Concert implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "time", length = 100)
    private String time;
    @Column(name = "location", length = 100)
    private String location;
    @Column(name = "Description", length = 2000)
    private String description;
    @Column(name = "Price", length = 45)
    private String price;
    @Column(name = "name", length = 100)
    private String name;
    @JoinColumn(name = "Artist", referencedColumnName = "Id")
    @ManyToOne
    private Artist artist;

    public Concert() {
    }

    public Concert(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Artist getArtist() {
        return artist;
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
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
        if (!(object instanceof Concert)) {
            return false;
        }
        Concert other = (Concert) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Concert[ id=" + id + " ]";
    }
    
}
