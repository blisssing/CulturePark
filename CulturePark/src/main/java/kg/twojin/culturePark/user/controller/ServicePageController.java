package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServicePageController {

    @RequestMapping(value = "serviceRequest.do")
    public ModelAndView serviceRequestPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_requestPage");
        return mv;
    }

    @RequestMapping(value = "ticketGuide.do")
    public ModelAndView serviceTicektGuide() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_ticketGuide");
        return mv;
    }

    @RequestMapping(value = "mobileGuide.do")
    public ModelAndView mobileGuide() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_mobileTicket");
        return mv;
    }
}
