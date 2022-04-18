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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "ORDERSTATUS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderstatus.findAll", query = "SELECT o FROM Orderstatus o"),
    @NamedQuery(name = "Orderstatus.findByTrackingnum", query = "SELECT o FROM Orderstatus o WHERE o.trackingnum = :trackingnum"),
    @NamedQuery(name = "Orderstatus.findByStatus", query = "SELECT o FROM Orderstatus o WHERE o.status = :status"),
    @NamedQuery(name = "Orderstatus.findByStatusdate", query = "SELECT o FROM Orderstatus o WHERE o.statusdate = :statusdate")})
public class Orderstatus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "TRACKINGNUM")
    private Integer trackingnum;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STATUS")
    private String status;
    @Column(name = "STATUSDATE")
    @Temporal(TemporalType.DATE)
    private Date statusdate;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID")
    @ManyToOne(optional = false)
    private Orderr orderid;

    public Orderstatus() {
    }

    public Orderstatus(Integer trackingnum) {
        this.trackingnum = trackingnum;
    }

    public Orderstatus(Integer trackingnum, String status) {
        this.trackingnum = trackingnum;
        this.status = status;
    }

    public Orderstatus(String status, Date statusdate, Orderr orderid) {
        this.status = status;
        this.statusdate = statusdate;
        this.orderid = orderid;
    }
    
    public Integer getTrackingnum() {
        return trackingnum;
    }

    public void setTrackingnum(Integer trackingnum) {
        this.trackingnum = trackingnum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getStatusdate() {
        return statusdate;
    }

    public void setStatusdate(Date statusdate) {
        this.statusdate = statusdate;
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
        hash += (trackingnum != null ? trackingnum.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderstatus)) {
            return false;
        }
        Orderstatus other = (Orderstatus) object;
        if ((this.trackingnum == null && other.trackingnum != null) || (this.trackingnum != null && !this.trackingnum.equals(other.trackingnum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Orderstatus[ trackingnum=" + trackingnum + " ]";
    }
    
}
