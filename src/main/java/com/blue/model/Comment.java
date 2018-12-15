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

@Entity
@Table(name = "comment", catalog = "blue", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c"),
    @NamedQuery(name = "Comment.findById", query = "SELECT c FROM Comment c WHERE c.id = :id"),
    @NamedQuery(name = "Comment.findByContent", query = "SELECT c FROM Comment c WHERE c.content = :content"),
    @NamedQuery(name = "Comment.findByCommentDate", query = "SELECT c FROM Comment c WHERE c.commentDate = :commentDate")})
public class Comment implements Serializable {
	
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String content;
    private Date commentDate;
    private User userId;
    
    
    public Comment() {}
    

    public Comment(Integer id) {
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
    

    @Column(name = "content", length = 1000)
    public String getContent() {
        return content;
    }
    

    public void setContent(String content) {
        this.content = content;
    }
    

    @Column(name = "commentDate")
    @Temporal(TemporalType.TIMESTAMP)
    public Date getCommentDate() {
        return commentDate;
    }
    

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    
    @JoinColumn(name = "userId", referencedColumnName = "Id")
    @ManyToOne
    public User getUserId() {
        return userId;
    }
    

    public void setUserId(User userId) {
        this.userId = userId;
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
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }
    

    @Override
    public String toString() {
        return "entity.Comment[ id=" + id + " ]";
    }
    
}
