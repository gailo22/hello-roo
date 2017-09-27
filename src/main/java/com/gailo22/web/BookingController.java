package com.gailo22.web;
import com.gailo22.domain.Booking;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/bookings")
@Controller
@RooWebScaffold(path = "bookings", formBackingObject = Booking.class)
public class BookingController {
}
