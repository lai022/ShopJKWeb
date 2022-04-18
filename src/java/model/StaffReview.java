/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "STAFF_REVIEW")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StaffReview.findAll", query = "SELECT s FROM StaffReview s"),
    @NamedQuery(name = "StaffReview.findBySreviewid", query = "SELECT s FROM StaffReview s WHERE s.sreviewid = :sreviewid"),
    @NamedQuery(name = "StaffReview.findByScomment", query = "SELECT s FROM StaffReview s WHERE s.scomment = :scomment"),
    @NamedQuery(name = "StaffReview.findBySreviewdate", query = "SELECT s FROM StaffReview s WHERE s.sreviewdate = :sreviewdate"),
    @NamedQuery(name = "StaffReview.findByReviewid", query = "SELECT s FROM StaffReview s WHERE s.reviewid = :reviewid")})
public class StaffReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "SREVIEWID")
    private Integer sreviewid;
    @Size(max = 100)
    @Column(name = "SCOMMENT")
    private String scomment;
    @Column(name = "SREVIEWDATE")
    @Temporal(TemporalType.DATE)
    private Date sreviewdate;
    @JoinColumn(name = "REVIEWID", referencedColumnName = "REVIEWID")
    @ManyToOne(optional = false)
    private Review reviewid;

    public StaffReview() {
    }

    public StaffReview(Integer sreviewid) {
        this.sreviewid = sreviewid;
    }
    
    public StaffReview(String scomment, Date sreviewdate, Review reviewid) {
        this.scomment = scomment;
        this.sreviewdate = sreviewdate;
        this.reviewid = reviewid;
    }

    public StaffReview(Integer sreviewid, String scomment, Date sreviewdate, Review reviewid) {
        this.sreviewid = sreviewid;
        this.scomment = scomment;
        this.sreviewdate = sreviewdate;
        this.reviewid = reviewid;
    }

    public Integer getSreviewid() {
        return sreviewid;
    }

    public void setSreviewid(Integer sreviewid) {
        this.sreviewid = sreviewid;
    }

    public String getScomment() {
        return scomment;
    }

    public void setScomment(String scomment) {
        this.scomment = scomment;
    }

    public Date getSreviewdate() {
        return sreviewdate;
    }

    public void setSreviewdate(Date sreviewdate) {
        this.sreviewdate = sreviewdate;
    }

    public Review getReviewid() {
        return reviewid;
    }

    public void setReviewid(Review reviewid) {
        this.reviewid = reviewid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sreviewid != null ? sreviewid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StaffReview)) {
            return false;
        }
        StaffReview other = (StaffReview) object;
        if ((this.sreviewid == null && other.sreviewid != null) || (this.sreviewid != null && !this.sreviewid.equals(other.sreviewid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.StaffReview[ sreviewid=" + sreviewid + " ]";
    }
    
}
