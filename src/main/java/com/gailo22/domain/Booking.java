package com.gailo22.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "BOOKING_ID", identifierField = "bookingId", table = "BOOKING_TBL")
public class Booking {

	@NotNull
    @Column(name = "name")
    private String name;
	
	@NotNull
	@Column(name = "email")
	private String email;
	
	@NotNull
    @ManyToOne
    @JoinColumn(name = "FLIGHT_ID")
    private Flight flight;
}
