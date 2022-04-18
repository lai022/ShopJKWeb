/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "CATEGORY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c"),
    @NamedQuery(name = "Category.findByCategoryid", query = "SELECT c FROM Category c WHERE c.categoryid = :categoryid"),
    @NamedQuery(name = "Category.findByCategorytype", query = "SELECT c FROM Category c WHERE c.categorytype = :categorytype"),
    @NamedQuery(name = "Category.findByCategorydesc", query = "SELECT c FROM Category c WHERE c.categorydesc = :categorydesc")})
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CATEGORYID")
    private Integer categoryid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "CATEGORYTYPE")
    private String categorytype;
    @Size(max = 3000)
    @Column(name = "CATEGORYDESC")
    private String categorydesc;
    @OneToMany(mappedBy = "categoryid")
    private List<Item> itemList;

    public Category() {
    }

    public Category(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public Category(Integer categoryid, String categorytype) {
        this.categoryid = categoryid;
        this.categorytype = categorytype;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategorytype() {
        return categorytype;
    }

    public void setCategorytype(String categorytype) {
        this.categorytype = categorytype;
    }

    public String getCategorydesc() {
        return categorydesc;
    }

    public void setCategorydesc(String categorydesc) {
        this.categorydesc = categorydesc;
    }

    @XmlTransient
    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (categoryid != null ? categoryid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Category)) {
            return false;
        }
        Category other = (Category) object;
        if ((this.categoryid == null && other.categoryid != null) || (this.categoryid != null && !this.categoryid.equals(other.categoryid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Category[ categoryid=" + categoryid + " ]";
    }
    
}
