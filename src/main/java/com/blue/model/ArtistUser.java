package com.blue.model;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sjx
 */
@Entity
@Table(name = "ArtistUser", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ArtistUser.findAll", query = "SELECT a FROM ArtistUser a")
    , @NamedQuery(name = "ArtistUser.findById", query = "SELECT a FROM ArtistUser a WHERE a.id = :id")
    , @NamedQuery(name = "ArtistUser.findByName", query = "SELECT a FROM ArtistUser a WHERE a.name = :name")
    , @NamedQuery(name = "ArtistUser.findByEmail", query = "SELECT a FROM ArtistUser a WHERE a.email = :email")
    , @NamedQuery(name = "ArtistUser.findByPassword", query = "SELECT a FROM ArtistUser a WHERE a.password = :password")})
public class ArtistUser implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "name", length = 100)
    private String name;
    @Column(name = "email", length = 100)
    private String email;
    @Column(name = "password", length = 100)
    private String password;
    @JoinColumn(name = "artistInfoId", referencedColumnName = "Id")
    @ManyToOne
    private Artist artistInfoId;

    public ArtistUser() {
    }

    public ArtistUser(Integer id) {
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

    public Artist getArtistInfoId() {
        return artistInfoId;
    }

    public void setArtistInfoId(Artist artistInfoId) {
        this.artistInfoId = artistInfoId;
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
        if (!(object instanceof ArtistUser)) {
            return false;
        }
        ArtistUser other = (ArtistUser) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ArtistUser[ id=" + id + " ]";
    }
    
}
