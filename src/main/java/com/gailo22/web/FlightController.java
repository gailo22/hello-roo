package com.gailo22.web;
import com.gailo22.domain.Flight;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/flights")
@Controller
@RooWebScaffold(path = "flights", formBackingObject = Flight.class)
public class FlightController {
}
