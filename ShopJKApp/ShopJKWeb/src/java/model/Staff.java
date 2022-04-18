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
@Table(name = "STAFF")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staff.findAll", query = "SELECT s FROM Staff s"),
    @NamedQuery(name = "Staff.findByStaffusername", query = "SELECT s FROM Staff s WHERE s.staffusername = :staffusername"),
    @NamedQuery(name = "Staff.findByStaffname", query = "SELECT s FROM Staff s WHERE s.staffname = :staffname"),
    @NamedQuery(name = "Staff.findByBirthdate", query = "SELECT s FROM Staff s WHERE s.birthdate = :birthdate"),
    @NamedQuery(name = "Staff.findByTelno", query = "SELECT s FROM Staff s WHERE s.telno = :telno"),
    @NamedQuery(name = "Staff.findByAddress", query = "SELECT s FROM Staff s WHERE s.address = :address"),
    @NamedQuery(name = "Staff.findByEmail", query = "SELECT s FROM Staff s WHERE s.email = :email"),
    @NamedQuery(name = "Staff.findByPassword", query = "SELECT s FROM Staff s WHERE s.password = :password"),
    @NamedQuery(name = "Staff.findByStatus", query = "SELECT s FROM Staff s WHERE s.status = :status")})
public class Staff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "STAFFUSERNAME")
    private String staffusername;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFFNAME")
    private String staffname;
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

    public Staff() {
    }

    public Staff(String staffusername) {
        this.staffusername = staffusername;
    }

    public Staff(String staffusername, String staffname, Date birthdate, String telno, String address, String email, String password, String status) {
        this.staffusername = staffusername;
        this.staffname = staffname;
        this.birthdate = birthdate;
        this.telno = telno;
        this.address = address;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public String getStaffusername() {
        return staffusername;
    }

    public void setStaffusername(String staffusername) {
        this.staffusername = staffusername;
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname;
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
        hash += (staffusername != null ? staffusername.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staff)) {
            return false;
        }
        Staff other = (Staff) object;
        if ((this.staffusername == null && other.staffusername != null) || (this.staffusername != null && !this.staffusername.equals(other.staffusername))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Staff[ staffusername=" + staffusername + " ]";
    }
    
}
