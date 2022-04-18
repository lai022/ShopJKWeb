package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Item;
import model.Orderr;
import model.StaffReview;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Review.class)
public class Review_ { 

    public static volatile ListAttribute<Review, StaffReview> staffReviewList;
    public static volatile SingularAttribute<Review, String> custcomment;
    public static volatile SingularAttribute<Review, Item> itemid;
    public static volatile SingularAttribute<Review, Date> reviewdate;
    public static volatile SingularAttribute<Review, Orderr> orderid;
    public static volatile SingularAttribute<Review, Integer> rating;
    public static volatile SingularAttribute<Review, Customer> custusername;
    public static volatile SingularAttribute<Review, Integer> reviewid;
    public static volatile SingularAttribute<Review, Integer> status;

}