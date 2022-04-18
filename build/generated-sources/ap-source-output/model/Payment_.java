package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orderr;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, Float> totalamount;
    public static volatile SingularAttribute<Payment, Orderr> orderid;
    public static volatile SingularAttribute<Payment, Integer> paymentid;
    public static volatile SingularAttribute<Payment, Float> subtotal;
    public static volatile SingularAttribute<Payment, Float> tax;

}