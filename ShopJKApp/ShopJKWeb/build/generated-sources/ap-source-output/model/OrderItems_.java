package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Item;
import model.Orderr;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(OrderItems.class)
public class OrderItems_ { 

    public static volatile SingularAttribute<OrderItems, Item> itemid;
    public static volatile SingularAttribute<OrderItems, Integer> orderItemsid;
    public static volatile SingularAttribute<OrderItems, Orderr> orderid;
    public static volatile SingularAttribute<OrderItems, Float> price;
    public static volatile SingularAttribute<OrderItems, Integer> qty;

}