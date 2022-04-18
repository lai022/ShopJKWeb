package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Review;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-15T14:45:36")
@StaticMetamodel(StaffReview.class)
public class StaffReview_ { 

    public static volatile SingularAttribute<StaffReview, String> scomment;
    public static volatile SingularAttribute<StaffReview, Date> sreviewdate;
    public static volatile SingularAttribute<StaffReview, Integer> sreviewid;
    public static volatile SingularAttribute<StaffReview, Review> reviewid;

}