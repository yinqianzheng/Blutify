package com.blue.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Manager", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Manager.findAll", query = "SELECT m FROM Manager m"),
    @NamedQuery(name = "Manager.findById", query = "SELECT m FROM Manager m WHERE m.id = :id"),
    @NamedQuery(name = "Manager.findByName", query = "SELECT m FROM Manager m WHERE m.name = :name"),
    @NamedQuery(name = "Manager.findByPassword", query = "SELECT m FROM Manager m WHERE m.password = :password"),
    @NamedQuery(name = "Manager.findByEmail", query = "SELECT m FROM Manager m WHERE m.email = :email")})
public class Manager implements Serializable {
	
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String name;
    private String password;
    private String email;

    
    public Manager() {}
    
    
    public Manager(Integer id) {
        this.id = id;
    }

    
    public Manager(Integer id, String name, String password, String email) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
    }

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    public Integer getId() {
        return id;
    }
    

    public void setId(Integer id) {
        this.id = id;
    }

    
    @Basic(optional = false)
    @Column(name = "name", nullable = false, length = 100)
    public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name;
    }
    

    @Basic(optional = false)
    @Column(name = "password", nullable = false, length = 100)
    public String getPassword() {
        return password;
    }

    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Basic(optional = false)
    @Column(name = "email", nullable = false, length = 100)
    public String getEmail() {
        return email;
    }
    

    public void setEmail(String email) {
        this.email = email;
    }

    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    
    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Manager)) {
            return false;
        }
        Manager other = (Manager) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    
    @Override
    public String toString() {
        return "entity.Manager[ id=" + id + " ]";
    }
    
}
