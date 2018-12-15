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
@Table(name = "subscriptionfee", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subscriptionfee.findAll", query = "SELECT s FROM Subscriptionfee s")
    , @NamedQuery(name = "Subscriptionfee.findById", query = "SELECT s FROM Subscriptionfee s WHERE s.id = :id")
    , @NamedQuery(name = "Subscriptionfee.findByFee", query = "SELECT s FROM Subscriptionfee s WHERE s.fee = :fee")})
public class Subscriptionfee implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "fee")
    private Integer fee;

    public Subscriptionfee() {
    }

    public Subscriptionfee(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFee() {
        return fee;
    }

    public void setFee(Integer fee) {
        this.fee = fee;
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
        if (!(object instanceof Subscriptionfee)) {
            return false;
        }
        Subscriptionfee other = (Subscriptionfee) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Subscriptionfee[ id=" + id + " ]";
    }
    
}
