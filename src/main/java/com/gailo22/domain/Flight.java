package com.gailo22.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "FLIGHT_ID", identifierField = "flightId", table = "FLIGHT_TBL")
public class Flight {

    @NotNull
    @ManyToOne
    @JoinColumn(name = "FLIGHT_DESC_ID")
    private FlightDescription flightDescription;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "flight")
    private Set<Booking> booking = new HashSet<Booking>();
}
