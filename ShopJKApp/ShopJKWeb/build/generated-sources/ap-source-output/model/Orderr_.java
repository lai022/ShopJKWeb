package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.OrderItems;
import model.Orderstatus;
import model.Payment;
import model.Receiver;
import model.Review;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Orderr.class)
public class Orderr_ { 

    public static volatile ListAttribute<Orderr, OrderItems> orderItemsList;
    public static volatile ListAttribute<Orderr, Review> reviewList;
    public static volatile SingularAttribute<Orderr, Receiver> receiverid;
    public static volatile SingularAttribute<Orderr, Integer> orderid;
    public static volatile ListAttribute<Orderr, Orderstatus> orderstatusList;
    public static volatile SingularAttribute<Orderr, Customer> custusername;
    public static volatile SingularAttribute<Orderr, Date> orderdate;
    public static volatile ListAttribute<Orderr, Payment> paymentList;

}