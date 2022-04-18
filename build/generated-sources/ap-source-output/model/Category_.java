package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Item;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Category.class)
public class Category_ { 

    public static volatile SingularAttribute<Category, String> categorydesc;
    public static volatile ListAttribute<Category, Item> itemList;
    public static volatile SingularAttribute<Category, Integer> categoryid;
    public static volatile SingularAttribute<Category, String> categorytype;

}