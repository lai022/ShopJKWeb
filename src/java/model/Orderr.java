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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "ORDERR")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderr.findAll", query = "SELECT o FROM Orderr o"),
    @NamedQuery(name = "Orderr.findByOrderid", query = "SELECT o FROM Orderr o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Orderr.findByOrderdate", query = "SELECT o FROM Orderr o WHERE o.orderdate = :orderdate"),
    @NamedQuery(name = "Orderr.findByCustusername", query = "SELECT o FROM Orderr o WHERE o.custusername = :custusername")})
public class Orderr implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDERID")
    private Integer orderid;
    @Column(name = "ORDERDATE")
    @Temporal(TemporalType.DATE)
    private Date orderdate;
    @OneToMany(mappedBy = "orderid")
    private List<OrderItems> orderItemsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderid")
    private List<Payment> paymentList;
    @JoinColumn(name = "CUSTUSERNAME", referencedColumnName = "CUSTUSERNAME")
    @ManyToOne(optional = false)
    private Customer custusername;
    @JoinColumn(name = "RECEIVERID", referencedColumnName = "RECEIVERID")
    @ManyToOne(optional = false)
    private Receiver receiverid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderid")
    private List<Orderstatus> orderstatusList;
    @OneToMany(mappedBy = "orderid")
    private List<Review> reviewList;

    public Orderr() {
    }

    public Orderr(Integer orderid) {
        this.orderid = orderid;
    }
    
    public Orderr(Date orderdate, Receiver receiverid, Customer custusername) {
        this.orderdate = orderdate;
        this.receiverid = receiverid;
        this.custusername = custusername;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    @XmlTransient
    public List<OrderItems> getOrderItemsList() {
        return orderItemsList;
    }

    public void setOrderItemsList(List<OrderItems> orderItemsList) {
        this.orderItemsList = orderItemsList;
    }

    @XmlTransient
    public List<Payment> getPaymentList() {
        return paymentList;
    }

    public void setPaymentList(List<Payment> paymentList) {
        this.paymentList = paymentList;
    }

    public Customer getCustusername() {
        return custusername;
    }

    public void setCustusername(Customer custusername) {
        this.custusername = custusername;
    }

    public Receiver getReceiverid() {
        return receiverid;
    }

    public void setReceiverid(Receiver receiverid) {
        this.receiverid = receiverid;
    }

    @XmlTransient
    public List<Orderstatus> getOrderstatusList() {
        return orderstatusList;
    }

    public void setOrderstatusList(List<Orderstatus> orderstatusList) {
        this.orderstatusList = orderstatusList;
    }

    @XmlTransient
    public List<Review> getReviewList() {
        return reviewList;
    }

    public void setReviewList(List<Review> reviewList) {
        this.reviewList = reviewList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderr)) {
            return false;
        }
        Orderr other = (Orderr) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Orderr[ orderid=" + orderid + " ]";
    }
    
}
