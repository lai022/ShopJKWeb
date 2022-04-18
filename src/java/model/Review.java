/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "REVIEW")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Review.findAll", query = "SELECT r FROM Review r"),
    @NamedQuery(name = "Review.findByReviewid", query = "SELECT r FROM Review r WHERE r.reviewid = :reviewid"),
    @NamedQuery(name = "Review.findByRating", query = "SELECT r FROM Review r WHERE r.rating = :rating"),
    @NamedQuery(name = "Review.findByCustcomment", query = "SELECT r FROM Review r WHERE r.custcomment = :custcomment"),
    @NamedQuery(name = "Review.findByReviewdate", query = "SELECT r FROM Review r WHERE r.reviewdate = :reviewdate"),
    @NamedQuery(name = "Review.findByStatus", query = "SELECT r FROM Review r WHERE r.status = :status")})
public class Review implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "REVIEWID")
    private Integer reviewid;
    @Column(name = "RATING")
    private Integer rating;
    @Size(max = 100)
    @Column(name = "CUSTCOMMENT")
    private String custcomment;
    @Column(name = "REVIEWDATE")
    @Temporal(TemporalType.DATE)
    private Date reviewdate;
    @Column(name = "STATUS")
    private Integer status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reviewid")
    private List<StaffReview> staffReviewList;
    @JoinColumn(name = "CUSTUSERNAME", referencedColumnName = "CUSTUSERNAME")
    @ManyToOne(optional = false)
    private Customer custusername;
    @JoinColumn(name = "ITEMID", referencedColumnName = "ITEMID")
    @ManyToOne(optional = false)
    private Item itemid;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID")
    @ManyToOne
    private Orderr orderid;

    public Review() {
    }

    public Review(Integer reviewid) {
        this.reviewid = reviewid;
    }
    
    public Review(Integer rating, String custcomment, Date reviewdate, Integer status, Customer custusername, Item itemid, Orderr orderid) {
        this.rating = rating;
        this.custcomment = custcomment;
        this.reviewdate = reviewdate;
        this.status = status;
        this.custusername = custusername;
        this.itemid = itemid;
        this.orderid = orderid;
    }

    public Integer getReviewid() {
        return reviewid;
    }

    public void setReviewid(Integer reviewid) {
        this.reviewid = reviewid;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getCustcomment() {
        return custcomment;
    }

    public void setCustcomment(String custcomment) {
        this.custcomment = custcomment;
    }

    public Date getReviewdate() {
        return reviewdate;
    }

    public void setReviewdate(Date reviewdate) {
        this.reviewdate = reviewdate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @XmlTransient
    public List<StaffReview> getStaffReviewList() {
        return staffReviewList;
    }

    public void setStaffReviewList(List<StaffReview> staffReviewList) {
        this.staffReviewList = staffReviewList;
    }

    public Customer getCustusername() {
        return custusername;
    }

    public void setCustusername(Customer custusername) {
        this.custusername = custusername;
    }

    public Item getItemid() {
        return itemid;
    }

    public void setItemid(Item itemid) {
        this.itemid = itemid;
    }

    public Orderr getOrderid() {
        return orderid;
    }

    public void setOrderid(Orderr orderid) {
        this.orderid = orderid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reviewid != null ? reviewid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Review)) {
            return false;
        }
        Review other = (Review) object;
        if ((this.reviewid == null && other.reviewid != null) || (this.reviewid != null && !this.reviewid.equals(other.reviewid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Review[ reviewid=" + reviewid + " ]";
    }
    
}
