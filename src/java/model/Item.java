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
@Table(name = "ITEM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Item.findAll", query = "SELECT i FROM Item i"),
    @NamedQuery(name = "Item.findByItemid", query = "SELECT i FROM Item i WHERE i.itemid = :itemid"),
    @NamedQuery(name = "Item.findByItemname", query = "SELECT i FROM Item i WHERE i.itemname = :itemname"),
    @NamedQuery(name = "Item.findByItemdesc", query = "SELECT i FROM Item i WHERE i.itemdesc = :itemdesc"),
    @NamedQuery(name = "Item.findByItemprice", query = "SELECT i FROM Item i WHERE i.itemprice = :itemprice"),
    @NamedQuery(name = "Item.findByQtyinstock", query = "SELECT i FROM Item i WHERE i.qtyinstock = :qtyinstock"),
    @NamedQuery(name = "Item.findByQtysold", query = "SELECT i FROM Item i WHERE i.qtysold = :qtysold"),
    @NamedQuery(name = "Item.findByStatus", query = "SELECT i FROM Item i WHERE i.status = :status"),
    @NamedQuery(name = "Item.findByItemimg", query = "SELECT i FROM Item i WHERE i.itemimg = :itemimg")})
public class Item implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ITEMID")
    private Integer itemid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ITEMNAME")
    private String itemname;
    @Size(max = 3000)
    @Column(name = "ITEMDESC")
    private String itemdesc;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ITEMPRICE")
    private float itemprice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "QTYINSTOCK")
    private int qtyinstock;
    @Column(name = "QTYSOLD")
    private Integer qtysold;
    @Size(max = 1)
    @Column(name = "STATUS")
    private String status;
    @Size(max = 1000)
    @Column(name = "ITEMIMG")
    private String itemimg;
    @OneToMany(mappedBy = "itemid")
    private List<OrderItems> orderItemsList;
    @JoinColumn(name = "CATEGORYID", referencedColumnName = "CATEGORYID")
    @ManyToOne
    private Category categoryid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "itemid")
    private List<Review> reviewList;

    public Item() {
    }

    public Item(Integer itemid) {
        this.itemid = itemid;
    }

    public Item(Integer itemid, String itemname, float itemprice, int qtyinstock) {
        this.itemid = itemid;
        this.itemname = itemname;
        this.itemprice = itemprice;
        this.qtyinstock = qtyinstock;
    }
    
    public Item(String itemname, String itemdesc, float itemprice, int qtyinstock, Integer qtysold, String status, Category categoryid) {
        this.itemname = itemname;
        this.itemdesc = itemdesc;
        this.itemprice = itemprice;
        this.qtyinstock = qtyinstock;
        this.qtysold = qtysold;
        this.status = status;
        this.categoryid = categoryid;
    }
    
    public Item(Integer itemid, String itemname, String itemdesc, float itemprice, int qtyinstock, Integer qtysold, String status, String fileName, Category categoryid) {
        this.itemid = itemid;
        this.itemname = itemname;
        this.itemdesc = itemdesc;
        this.itemprice = itemprice;
        this.qtyinstock = qtyinstock;
        this.qtysold = qtysold;
        this.status = status;
        this.itemimg = fileName;
        this.categoryid = categoryid;
    }

    public Item(String itemname, String itemdesc, float itemprice, int qtyinstock, int qtysold, String status, String fileName, Category category) {
        this.itemname = itemname;
        this.itemdesc = itemdesc;
        this.itemprice = itemprice;
        this.qtyinstock = qtyinstock;
        this.qtysold = qtysold;
        this.status = status;
        this.categoryid = category;
        this.itemimg = fileName;
    }

   
    
    public double getTotalSales(float itemprice, int qtysold){
        
        this.itemprice = itemprice;
        this.qtysold = qtysold;
        

        Float value = itemprice * qtysold;
        return value.doubleValue();
        
    }
    
    public Float getTotalSales2(float itemprice, int qtysold){
        
        this.itemprice = itemprice;
        this.qtysold = qtysold;
        

        Float value = itemprice * qtysold;
        return value;
        
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public String getItemdesc() {
        return itemdesc;
    }

    public void setItemdesc(String itemdesc) {
        this.itemdesc = itemdesc;
    }

    public float getItemprice() {
        return itemprice;
    }

    public void setItemprice(float itemprice) {
        this.itemprice = itemprice;
    }

    public int getQtyinstock() {
        return qtyinstock;
    }

    public void setQtyinstock(int qtyinstock) {
        this.qtyinstock = qtyinstock;
    }

    public Integer getQtysold() {
        return qtysold;
    }

    public void setQtysold(Integer qtysold) {
        this.qtysold = qtysold;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getItemimg() {
        return itemimg;
    }

    public void setItemimg(String itemimg) {
        this.itemimg = itemimg;
    }

    @XmlTransient
    public List<OrderItems> getOrderItemsList() {
        return orderItemsList;
    }

    public void setOrderItemsList(List<OrderItems> orderItemsList) {
        this.orderItemsList = orderItemsList;
    }

    public Category getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Category categoryid) {
        this.categoryid = categoryid;
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
        hash += (itemid != null ? itemid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Item)) {
            return false;
        }
        Item other = (Item) object;
        if ((this.itemid == null && other.itemid != null) || (this.itemid != null && !this.itemid.equals(other.itemid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Item[ itemid=" + itemid + " ]";
    }
    
}