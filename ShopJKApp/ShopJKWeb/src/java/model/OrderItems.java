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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "ORDER_ITEMS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderItems.findAll", query = "SELECT o FROM OrderItems o"),
    @NamedQuery(name = "OrderItems.findByOrderItemsid", query = "SELECT o FROM OrderItems o WHERE o.orderItemsid = :orderItemsid"),
    @NamedQuery(name = "OrderItems.findByQty", query = "SELECT o FROM OrderItems o WHERE o.qty = :qty"),
    @NamedQuery(name = "OrderItems.findByPrice", query = "SELECT o FROM OrderItems o WHERE o.price = :price"),
    @NamedQuery(name = "OrderItems.findByOrderid", query = "SELECT o FROM OrderItems o WHERE o.orderid = :orderid")})
public class OrderItems implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDER_ITEMSID")
    private Integer orderItemsid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "QTY")
    private int qty;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private float price;
    @JoinColumn(name = "ITEMID", referencedColumnName = "ITEMID")
    @ManyToOne
    private Item itemid;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID")
    @ManyToOne
    private Orderr orderid;

    public OrderItems() {
    }

    public OrderItems(Integer orderItemsid) {
        this.orderItemsid = orderItemsid;
    }

    public OrderItems(Integer orderItemsid, int qty, float price) {
        this.orderItemsid = orderItemsid;
        this.qty = qty;
        this.price = price;
    }
    
    public OrderItems(Orderr orderid, Item itemid, int qty, float price) {
        this.orderid = orderid;
        this.itemid = itemid;
        this.qty = qty;
        this.price = price;
    }

    public Integer getOrderItemsid() {
        return orderItemsid;
    }

    public void setOrderItemsid(Integer orderItemsid) {
        this.orderItemsid = orderItemsid;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
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
        hash += (orderItemsid != null ? orderItemsid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderItems)) {
            return false;
        }
        OrderItems other = (OrderItems) object;
        if ((this.orderItemsid == null && other.orderItemsid != null) || (this.orderItemsid != null && !this.orderItemsid.equals(other.orderItemsid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.OrderItems[ orderItemsid=" + orderItemsid + " ]";
    }
    
}
