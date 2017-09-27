// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gailo22.web;

import com.gailo22.domain.FlightDescription;
import com.gailo22.web.FlightDescriptionController;
import java.io.UnsupportedEncodingException;
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

privileged aspect FlightDescriptionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FlightDescriptionController.create(@Valid FlightDescription flightDescription, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, flightDescription);
            return "flightdescriptions/create";
        }
        uiModel.asMap().clear();
        flightDescription.persist();
        return "redirect:/flightdescriptions/" + encodeUrlPathSegment(flightDescription.getFlightDescId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FlightDescriptionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new FlightDescription());
        return "flightdescriptions/create";
    }
    
    @RequestMapping(value = "/{flightDescId}", produces = "text/html")
    public String FlightDescriptionController.show(@PathVariable("flightDescId") Long flightDescId, Model uiModel) {
        uiModel.addAttribute("flightdescription", FlightDescription.findFlightDescription(flightDescId));
        uiModel.addAttribute("itemId", flightDescId);
        return "flightdescriptions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FlightDescriptionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("flightdescriptions", FlightDescription.findFlightDescriptionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) FlightDescription.countFlightDescriptions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("flightdescriptions", FlightDescription.findAllFlightDescriptions(sortFieldName, sortOrder));
        }
        return "flightdescriptions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FlightDescriptionController.update(@Valid FlightDescription flightDescription, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, flightDescription);
            return "flightdescriptions/update";
        }
        uiModel.asMap().clear();
        flightDescription.merge();
        return "redirect:/flightdescriptions/" + encodeUrlPathSegment(flightDescription.getFlightDescId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{flightDescId}", params = "form", produces = "text/html")
    public String FlightDescriptionController.updateForm(@PathVariable("flightDescId") Long flightDescId, Model uiModel) {
        populateEditForm(uiModel, FlightDescription.findFlightDescription(flightDescId));
        return "flightdescriptions/update";
    }
    
    @RequestMapping(value = "/{flightDescId}", method = RequestMethod.DELETE, produces = "text/html")
    public String FlightDescriptionController.delete(@PathVariable("flightDescId") Long flightDescId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FlightDescription flightDescription = FlightDescription.findFlightDescription(flightDescId);
        flightDescription.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/flightdescriptions";
    }
    
    void FlightDescriptionController.populateEditForm(Model uiModel, FlightDescription flightDescription) {
        uiModel.addAttribute("flightDescription", flightDescription);
    }
    
    String FlightDescriptionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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