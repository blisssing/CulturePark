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

    @RequestMapping(value = "bookingGuide.do")
    public ModelAndView bookingGuide() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_bookingGuide");
        return mv;
    }

    @RequestMapping(value = "faqPage.do")
    public ModelAndView faqPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_faqPage");
        return mv;
    }

    @RequestMapping(value = "refundGuide.do")
    public ModelAndView refundGuide() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_refund");
        return mv;
    }

    @RequestMapping(value = "ticketingGuide.do")
    public ModelAndView ticketingGuide() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_ticketing");
        return mv;
    }

    @RequestMapping(value = "faqBoard.do")
    public ModelAndView getFAQBoard() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_faqBoard");
        return mv;
    }

    @RequestMapping(value = "sellerGuide.do")
    public ModelAndView sellerGuide() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_sellerGuide");
        return mv;
    }

}
