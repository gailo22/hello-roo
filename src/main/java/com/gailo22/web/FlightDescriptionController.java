package com.gailo22.web;
import com.gailo22.domain.FlightDescription;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/flightdescriptions")
@Controller
@RooWebScaffold(path = "flightdescriptions", formBackingObject = FlightDescription.class)
public class FlightDescriptionController {
}
