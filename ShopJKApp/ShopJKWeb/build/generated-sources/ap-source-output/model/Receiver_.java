package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Orderr;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Receiver.class)
public class Receiver_ { 

    public static volatile SingularAttribute<Receiver, String> receivername;
    public static volatile SingularAttribute<Receiver, String> receiverphone;
    public static volatile SingularAttribute<Receiver, Integer> receiverid;
    public static volatile SingularAttribute<Receiver, String> receiveraddress;
    public static volatile SingularAttribute<Receiver, Customer> custusername;
    public static volatile ListAttribute<Receiver, Orderr> orderrList;

}