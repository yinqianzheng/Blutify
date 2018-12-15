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
@Table(name = "paymentHistory", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PaymentHistory.findAll", query = "SELECT p FROM PaymentHistory p")
    , @NamedQuery(name = "PaymentHistory.findById", query = "SELECT p FROM PaymentHistory p WHERE p.id = :id")
    , @NamedQuery(name = "PaymentHistory.findByPaymentAmount", query = "SELECT p FROM PaymentHistory p WHERE p.paymentAmount = :paymentAmount")
    , @NamedQuery(name = "PaymentHistory.findByCreditNumber", query = "SELECT p FROM PaymentHistory p WHERE p.creditNumber = :creditNumber")
    , @NamedQuery(name = "PaymentHistory.findByPaymenttype", query = "SELECT p FROM PaymentHistory p WHERE p.paymenttype = :paymenttype")
    , @NamedQuery(name = "PaymentHistory.findByPaymentDate", query = "SELECT p FROM PaymentHistory p WHERE p.paymentDate = :paymentDate")})
public class PaymentHistory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(name = "paymentAmount", length = 100)
    private String paymentAmount;
    @Column(name = "creditNumber", length = 100)
    private String creditNumber;
    @Column(name = "paymenttype", length = 100)
    private String paymenttype;
    @Basic(optional = false)
    @Column(name = "paymentDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;
    @JoinColumn(name = "PaymentUserId", referencedColumnName = "Id")
    @ManyToOne
    private User paymentUserId;

    public PaymentHistory() {
    }

    public PaymentHistory(Integer id) {
        this.id = id;
    }

    public PaymentHistory(Integer id, Date paymentDate) {
        this.id = id;
        this.paymentDate = paymentDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(String paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public String getCreditNumber() {
        return creditNumber;
    }

    public void setCreditNumber(String creditNumber) {
        this.creditNumber = creditNumber;
    }

    public String getPaymenttype() {
        return paymenttype;
    }

    public void setPaymenttype(String paymenttype) {
        this.paymenttype = paymenttype;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public User getPaymentUserId() {
        return paymentUserId;
    }

    public void setPaymentUserId(User paymentUserId) {
        this.paymentUserId = paymentUserId;
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
        if (!(object instanceof PaymentHistory)) {
            return false;
        }
        PaymentHistory other = (PaymentHistory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PaymentHistory[ id=" + id + " ]";
    }
    
}
