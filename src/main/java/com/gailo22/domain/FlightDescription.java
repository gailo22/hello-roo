package com.gailo22.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "FLIGHT_DESC_ID", identifierField = "flightDescId", table = "FLIGHT_DESC_TBL", finders = { "findFlightDescriptionsByDestinationCityLikeAndOriginCityLike" })
public class FlightDescription {

    @NotNull
    @Column(name = "FLT_ORIGIN")
    @Size(min = 3, max = 20)
    private String originCity;

    @NotNull
    @Column(name = "FLT_DESTINATION")
    @Size(min = 3, max = 20)
    private String destinationCity;

    @Column(name = "PRICE")
    private Float price;
}
