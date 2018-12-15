package com.blue.model;


import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "advertisement", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Advertisement.findAll", query = "SELECT a FROM Advertisement a")
    , @NamedQuery(name = "Advertisement.findById", query = "SELECT a FROM Advertisement a WHERE a.id = :id")
    , @NamedQuery(name = "Advertisement.findByName", query = "SELECT a FROM Advertisement a WHERE a.name = :name")
    , @NamedQuery(name = "Advertisement.findByDescription", query = "SELECT a FROM Advertisement a WHERE a.description = :description")
    , @NamedQuery(name = "Advertisement.findByImageUrl", query = "SELECT a FROM Advertisement a WHERE a.imageUrl = :imageUrl")
    , @NamedQuery(name = "Advertisement.findByClickcount", query = "SELECT a FROM Advertisement a WHERE a.clickcount = :clickcount")
    , @NamedQuery(name = "Advertisement.findByAddress", query = "SELECT a FROM Advertisement a WHERE a.address = :address")})
public class Advertisement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "name", length = 100)
    private String name;
    @Column(name = "description", length = 2000)
    private String description;
    @Column(name = "imageUrl", length = 1000)
    private String imageUrl;
    @Column(name = "clickcount", length = 45)
    private String clickcount;
    @Column(name = "address", length = 1000)
    private String address;

    public Advertisement() {
    }

    public Advertisement(Integer id) {
        this.id = id;
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

    public String getClickcount() {
        return clickcount;
    }

    public void setClickcount(String clickcount) {
        this.clickcount = clickcount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        if (!(object instanceof Advertisement)) {
            return false;
        }
        Advertisement other = (Advertisement) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Advertisement[ id=" + id + " ]";
    }
    
}
