package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orderr;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(Orderstatus.class)
public class Orderstatus_ { 

    public static volatile SingularAttribute<Orderstatus, Integer> trackingnum;
    public static volatile SingularAttribute<Orderstatus, Orderr> orderid;
    public static volatile SingularAttribute<Orderstatus, String> status;
    public static volatile SingularAttribute<Orderstatus, Date> statusdate;

}