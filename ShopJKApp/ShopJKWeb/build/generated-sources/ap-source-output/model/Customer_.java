package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orderr;
import model.Receiver;
import model.Review;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile ListAttribute<Customer, Review> reviewList;
    public static volatile SingularAttribute<Customer, String> password;
    public static volatile SingularAttribute<Customer, Date> birthdate;
    public static volatile SingularAttribute<Customer, String> address;
    public static volatile ListAttribute<Customer, Receiver> receiverList;
    public static volatile SingularAttribute<Customer, String> custusername;
    public static volatile ListAttribute<Customer, Orderr> orderrList;
    public static volatile SingularAttribute<Customer, String> custname;
    public static volatile SingularAttribute<Customer, String> telno;
    public static volatile SingularAttribute<Customer, String> email;
    public static volatile SingularAttribute<Customer, String> status;

}