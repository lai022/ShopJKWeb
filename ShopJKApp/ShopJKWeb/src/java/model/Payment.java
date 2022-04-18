/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
 * @author HP
 */
@Entity
@Table(name = "PAYMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p"),
    @NamedQuery(name = "Payment.findByPaymentid", query = "SELECT p FROM Payment p WHERE p.paymentid = :paymentid"),
    @NamedQuery(name = "Payment.findBySubtotal", query = "SELECT p FROM Payment p WHERE p.subtotal = :subtotal"),
    @NamedQuery(name = "Payment.findByTax", query = "SELECT p FROM Payment p WHERE p.tax = :tax"),
    @NamedQuery(name = "Payment.findByTotalamount", query = "SELECT p FROM Payment p WHERE p.totalamount = :totalamount")})
public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PAYMENTID")
    private Integer paymentid;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "SUBTOTAL")
    private Float subtotal;
    @Column(name = "TAX")
    private Float tax;
    @Column(name = "TOTALAMOUNT")
    private Float totalamount;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID")
    @ManyToOne(optional = false)
    private Orderr orderid;

    public Payment() {
    }

    public Payment(Integer paymentid) {
        this.paymentid = paymentid;
    }
    
    public Payment(Float subtotal, Float tax, Float totalamount, Orderr orderid) {
        this.subtotal = subtotal;
        this.tax  =  tax;
        this.totalamount  =  totalamount;
        this.orderid = orderid;
    }

    public Integer getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(Integer paymentid) {
        this.paymentid = paymentid;
    }

    public Float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Float subtotal) {
        this.subtotal = subtotal;
    }

    public Float getTax() {
        return tax;
    }

    public void setTax(Float tax) {
        this.tax = tax;
    }

    public Float getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(Float totalamount) {
        this.totalamount = totalamount;
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
        hash += (paymentid != null ? paymentid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.paymentid == null && other.paymentid != null) || (this.paymentid != null && !this.paymentid.equals(other.paymentid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Payment[ paymentid=" + paymentid + " ]";
    }
    
}
