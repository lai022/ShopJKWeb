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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "MANAGER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Manager.findAll", query = "SELECT m FROM Manager m"),
    @NamedQuery(name = "Manager.findByManagerusername", query = "SELECT m FROM Manager m WHERE m.managerusername = :managerusername"),
    @NamedQuery(name = "Manager.findByManagername", query = "SELECT m FROM Manager m WHERE m.managername = :managername"),
    @NamedQuery(name = "Manager.findByBirthdate", query = "SELECT m FROM Manager m WHERE m.birthdate = :birthdate"),
    @NamedQuery(name = "Manager.findByTelno", query = "SELECT m FROM Manager m WHERE m.telno = :telno"),
    @NamedQuery(name = "Manager.findByAddress", query = "SELECT m FROM Manager m WHERE m.address = :address"),
    @NamedQuery(name = "Manager.findByEmail", query = "SELECT m FROM Manager m WHERE m.email = :email"),
    @NamedQuery(name = "Manager.findByPassword", query = "SELECT m FROM Manager m WHERE m.password = :password"),
    @NamedQuery(name = "Manager.findByStatus", query = "SELECT m FROM Manager m WHERE m.status = :status")})
public class Manager implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "MANAGERUSERNAME")
    private String managerusername;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "MANAGERNAME")
    private String managername;
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

    public Manager() {
    }

    public Manager(String managerusername) {
        this.managerusername = managerusername;
    }

    public Manager(String managerusername, String managername, Date birthdate, String telno, String address, String email, String password, String status) {
        this.managerusername = managerusername;
        this.managername = managername;
        this.birthdate = birthdate;
        this.telno = telno;
        this.address = address;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public String getManagerusername() {
        return managerusername;
    }

    public void setManagerusername(String managerusername) {
        this.managerusername = managerusername;
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (managerusername != null ? managerusername.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Manager)) {
            return false;
        }
        Manager other = (Manager) object;
        if ((this.managerusername == null && other.managerusername != null) || (this.managerusername != null && !this.managerusername.equals(other.managerusername))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Manager[ managerusername=" + managerusername + " ]";
    }
    
}
