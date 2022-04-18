/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "RECEIVER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Receiver.findAll", query = "SELECT r FROM Receiver r"),
    @NamedQuery(name = "Receiver.findByReceiverid", query = "SELECT r FROM Receiver r WHERE r.receiverid = :receiverid"),
    @NamedQuery(name = "Receiver.findByReceivername", query = "SELECT r FROM Receiver r WHERE r.receivername = :receivername"),
    @NamedQuery(name = "Receiver.findByReceiverphone", query = "SELECT r FROM Receiver r WHERE r.receiverphone = :receiverphone"),
    @NamedQuery(name = "Receiver.findByReceiveraddress", query = "SELECT r FROM Receiver r WHERE r.receiveraddress = :receiveraddress"),
    @NamedQuery(name = "Receiver.findByCustusername", query = "SELECT r FROM Receiver r WHERE r.custusername = :custusername")})
public class Receiver implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "RECEIVERID")
    private Integer receiverid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "RECEIVERNAME")
    private String receivername;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "RECEIVERPHONE")
    private String receiverphone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "RECEIVERADDRESS")
    private String receiveraddress;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receiverid")
    private List<Orderr> orderrList;
    @JoinColumn(name = "CUSTUSERNAME", referencedColumnName = "CUSTUSERNAME")
    @ManyToOne(optional = false)
    private Customer custusername;

    public Receiver() {
    }

    public Receiver(Integer receiverid) {
        this.receiverid = receiverid;
    }

    public Receiver(Integer receiverid, String receivername, String receiverphone, String receiveraddress) {
        this.receiverid = receiverid;
        this.receivername = receivername;
        this.receiverphone = receiverphone;
        this.receiveraddress = receiveraddress;
    }
    
    public Receiver(String receivername, String receiverphone, String receiveraddress, Customer custusername) {
        this.receivername = receivername;
        this.receiverphone = receiverphone;
        this.receiveraddress = receiveraddress;
        this.custusername = custusername;
    }
    
    public Receiver(Integer receiverid, String receivername, String receiverphone, String receiveraddress, Customer custusername) {
        this.receiverid = receiverid;
        this.receivername = receivername;
        this.receiverphone = receiverphone;
        this.receiveraddress = receiveraddress;
        this.custusername = custusername;
    }

    public Integer getReceiverid() {
        return receiverid;
    }

    public void setReceiverid(Integer receiverid) {
        this.receiverid = receiverid;
    }

    public String getReceivername() {
        return receivername;
    }

    public void setReceivername(String receivername) {
        this.receivername = receivername;
    }

    public String getReceiverphone() {
        return receiverphone;
    }

    public void setReceiverphone(String receiverphone) {
        this.receiverphone = receiverphone;
    }

    public String getReceiveraddress() {
        return receiveraddress;
    }

    public void setReceiveraddress(String receiveraddress) {
        this.receiveraddress = receiveraddress;
    }

    @XmlTransient
    public List<Orderr> getOrderrList() {
        return orderrList;
    }

    public void setOrderrList(List<Orderr> orderrList) {
        this.orderrList = orderrList;
    }

    public Customer getCustusername() {
        return custusername;
    }

    public void setCustusername(Customer custusername) {
        this.custusername = custusername;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (receiverid != null ? receiverid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Receiver)) {
            return false;
        }
        Receiver other = (Receiver) object;
        if ((this.receiverid == null && other.receiverid != null) || (this.receiverid != null && !this.receiverid.equals(other.receiverid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Receiver[ receiverid=" + receiverid + " ]";
    }
    
}
