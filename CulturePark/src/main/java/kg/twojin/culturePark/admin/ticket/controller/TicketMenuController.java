package kg.twojin.culturePark.admin.ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TicketMenuController {


    @RequestMapping(value = "paymentPage.ado")
    public ModelAndView paymentList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pm_paymentList");
        return mv;
    }

    @RequestMapping(value = "refundPage.ado")
    public ModelAndView refundList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pm_refundList");
        return mv;
    }
}
