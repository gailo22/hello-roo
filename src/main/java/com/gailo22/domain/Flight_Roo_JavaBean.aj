// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gailo22.domain;

import com.gailo22.domain.Booking;
import com.gailo22.domain.Flight;
import com.gailo22.domain.FlightDescription;
import java.util.Set;

privileged aspect Flight_Roo_JavaBean {
    
    public FlightDescription Flight.getFlightDescription() {
        return this.flightDescription;
    }
    
    public void Flight.setFlightDescription(FlightDescription flightDescription) {
        this.flightDescription = flightDescription;
    }
    
    public Set<Booking> Flight.getBooking() {
        return this.booking;
    }
    
    public void Flight.setBooking(Set<Booking> booking) {
        this.booking = booking;
    }
    
}