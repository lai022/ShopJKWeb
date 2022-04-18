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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "CUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c"),
    @NamedQuery(name = "Customer.findByCustusername", query = "SELECT c FROM Customer c WHERE c.custusername = :custusername"),
    @NamedQuery(name = "Customer.findByCustname", query = "SELECT c FROM Customer c WHERE c.custname = :custname"),
    @NamedQuery(name = "Customer.findByBirthdate", query = "SELECT c FROM Customer c WHERE c.birthdate = :birthdate"),
    @NamedQuery(name = "Customer.findByTelno", query = "SELECT c FROM Customer c WHERE c.telno = :telno"),
    @NamedQuery(name = "Customer.findByAddress", query = "SELECT c FROM Customer c WHERE c.address = :address"),
    @NamedQuery(name = "Customer.findByEmail", query = "SELECT c FROM Customer c WHERE c.email = :email"),
    @NamedQuery(name = "Customer.findByPassword", query = "SELECT c FROM Customer c WHERE c.password = :password"),
    @NamedQuery(name = "Customer.findByStatus", query = "SELECT c FROM Customer c WHERE c.status = :status")})
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "CUSTUSERNAME")
    private String custusername;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "CUSTNAME")
    private String custname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "BIRTHDATE")
    @Temporal(TemporalType.DATE)
    private Date birthdate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "TELNO")
    private String telno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "ADDRESS")
    private String address;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 254)
    @Column(name = "EMAIL")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "PASSWORD")
    private String password;
    @Size(max = 1)
    @Column(name = "STATUS")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "custusername")
    private List<Orderr> orderrList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "custusername")
    private List<Review> reviewList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "custusername")
    private List<Receiver> receiverList;

    public Customer() {
    }

    public Customer(String custusername) {
        this.custusername = custusername;
    }

    public Customer(String custusername, String custname, Date birthdate, String telno, String address, String email, String password) {
        this.custusername = custusername;
        this.custname = custname;
        this.birthdate = birthdate;
        this.telno = telno;
        this.address = address;
        this.email = email;
        this.password = password;
    }
    
    public Customer(String custusername, String custname, Date birthdate, String telno, String address, String email, String password, String status) {
        this.custusername = custusername;
        this.custname = custname;
        this.birthdate = birthdate;
        this.telno = telno;
        this.address = address;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public String getCustusername() {
        return custusername;
    }

    public void setCustusername(String custusername) {
        this.custusername = custusername;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getTelno() {
        return telno;
    }

    public void setTelno(String telno) {
        this.telno = telno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public List<Orderr> getOrderrList() {
        return orderrList;
    }

    public void setOrderrList(List<Orderr> orderrList) {
        this.orderrList = orderrList;
    }

    @XmlTransient
    public List<Review> getReviewList() {
        return reviewList;
    }

    public void setReviewList(List<Review> reviewList) {
        this.reviewList = reviewList;
    }

    @XmlTransient
    public List<Receiver> getReceiverList() {
        return receiverList;
    }

    public void setReceiverList(List<Receiver> receiverList) {
        this.receiverList = receiverList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (custusername != null ? custusername.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.custusername == null && other.custusername != null) || (this.custusername != null && !this.custusername.equals(other.custusername))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Customer[ custusername=" + custusername + " ]";
    }
    
}
