// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gailo22.domain;

import com.gailo22.domain.Booking;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect Booking_Roo_Jpa_Entity {
    
    declare @type: Booking: @Entity;
    
    declare @type: Booking: @Table(name = "BOOKING_TBL");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "BOOKING_ID")
    private Long Booking.bookingId;
    
    @Version
    @Column(name = "version")
    private Integer Booking.version;
    
    public Long Booking.getBookingId() {
        return this.bookingId;
    }
    
    public void Booking.setBookingId(Long id) {
        this.bookingId = id;
    }
    
    public Integer Booking.getVersion() {
        return this.version;
    }
    
    public void Booking.setVersion(Integer version) {
        this.version = version;
    }
    
}
