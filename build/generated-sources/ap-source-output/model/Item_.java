package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Category;
import model.OrderItems;
import model.Review;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Item.class)
public class Item_ { 

    public static volatile SingularAttribute<Item, Integer> itemid;
    public static volatile ListAttribute<Item, OrderItems> orderItemsList;
    public static volatile ListAttribute<Item, Review> reviewList;
    public static volatile SingularAttribute<Item, String> itemdesc;
    public static volatile SingularAttribute<Item, Integer> qtyinstock;
    public static volatile SingularAttribute<Item, String> itemimg;
    public static volatile SingularAttribute<Item, String> itemname;
    public static volatile SingularAttribute<Item, Float> itemprice;
    public static volatile SingularAttribute<Item, Integer> qtysold;
    public static volatile SingularAttribute<Item, Category> categoryid;
    public static volatile SingularAttribute<Item, String> status;

}