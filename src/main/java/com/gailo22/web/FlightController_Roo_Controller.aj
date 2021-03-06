// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gailo22.web;

import com.gailo22.domain.Booking;
import com.gailo22.domain.Flight;
import com.gailo22.domain.FlightDescription;
import com.gailo22.web.FlightController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect FlightController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FlightController.create(@Valid Flight flight, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, flight);
            return "flights/create";
        }
        uiModel.asMap().clear();
        flight.persist();
        return "redirect:/flights/" + encodeUrlPathSegment(flight.getFlightId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FlightController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Flight());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (FlightDescription.countFlightDescriptions() == 0) {
            dependencies.add(new String[] { "flightDescription", "flightdescriptions" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "flights/create";
    }
    
    @RequestMapping(value = "/{flightId}", produces = "text/html")
    public String FlightController.show(@PathVariable("flightId") Long flightId, Model uiModel) {
        uiModel.addAttribute("flight", Flight.findFlight(flightId));
        uiModel.addAttribute("itemId", flightId);
        return "flights/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FlightController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("flights", Flight.findFlightEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Flight.countFlights() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("flights", Flight.findAllFlights(sortFieldName, sortOrder));
        }
        return "flights/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FlightController.update(@Valid Flight flight, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, flight);
            return "flights/update";
        }
        uiModel.asMap().clear();
        flight.merge();
        return "redirect:/flights/" + encodeUrlPathSegment(flight.getFlightId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{flightId}", params = "form", produces = "text/html")
    public String FlightController.updateForm(@PathVariable("flightId") Long flightId, Model uiModel) {
        populateEditForm(uiModel, Flight.findFlight(flightId));
        return "flights/update";
    }
    
    @RequestMapping(value = "/{flightId}", method = RequestMethod.DELETE, produces = "text/html")
    public String FlightController.delete(@PathVariable("flightId") Long flightId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Flight flight = Flight.findFlight(flightId);
        flight.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/flights";
    }
    
    void FlightController.populateEditForm(Model uiModel, Flight flight) {
        uiModel.addAttribute("flight", flight);
        uiModel.addAttribute("bookings", Booking.findAllBookings());
        uiModel.addAttribute("flightdescriptions", FlightDescription.findAllFlightDescriptions());
    }
    
    String FlightController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
