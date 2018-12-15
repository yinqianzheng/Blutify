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

@Entity
@Table(name = "CreditCard", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CreditCard.findAll", query = "SELECT c FROM CreditCard c"),
    @NamedQuery(name = "CreditCard.findById", query = "SELECT c FROM CreditCard c WHERE c.id = :id"),
    @NamedQuery(name = "CreditCard.findByLastName", query = "SELECT c FROM CreditCard c WHERE c.lastName = :lastName"),
    @NamedQuery(name = "CreditCard.findByFirstName", query = "SELECT c FROM CreditCard c WHERE c.firstName = :firstName"),
    @NamedQuery(name = "CreditCard.findByCreditCardNumber", query = "SELECT c FROM CreditCard c WHERE c.creditCardNumber = :creditCardNumber"),
    @NamedQuery(name = "CreditCard.findByExpirtationDate", query = "SELECT c FROM CreditCard c WHERE c.expirtationDate = :expirtationDate"),
    @NamedQuery(name = "CreditCard.findByCvs", query = "SELECT c FROM CreditCard c WHERE c.cvs = :cvs")})
public class CreditCard implements Serializable {
	
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String lastName;
    private String firstName;
    private String creditCardNumber;
    private String expirtationDate;
    private Integer cvs;
    private User holderId;

    
    public CreditCard() {}
    
    
    public CreditCard(Integer id) {
        this.id = id;
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

    
    @Column(name = "LastName", length = 45)
    public String getLastName() {
        return lastName;
    }
    

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    

    @Column(name = "FirstName", length = 45)
    public String getFirstName() {
        return firstName;
    }

    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    
    @Column(name = "CreditCardNumber", length = 45)
    public String getCreditCardNumber() {
        return creditCardNumber;
    }
    

    public void setCreditCardNumber(String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }

    
    @Column(name = "ExpirtationDate", length = 45)
    public String getExpirtationDate() {
        return expirtationDate;
    }

    
    public void setExpirtationDate(String expirtationDate) {
        this.expirtationDate = expirtationDate;
    }
    

    @Column(name = "CVS")
    public Integer getCvs() {
        return cvs;
    }

    
    public void setCvs(Integer cvs) {
        this.cvs = cvs;
    }

    
    @JoinColumn(name = "HolderId", referencedColumnName = "Id")
    @ManyToOne
    public User getHolderId() {
        return holderId;
    }
    

    public void setHolderId(User holderId) {
        this.holderId = holderId;
    }

    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }
    

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof CreditCard)) {
            return false;
        }
        CreditCard other = (CreditCard) object;
        if ((this.id == null && other.id != null) 
        		|| (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    
    @Override
    public String toString() {
        return "entity.CreditCard[ id=" + id + " ]";
    }
    
}
