package kg.twojin.culturePark.admin.ticket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class TicketPurchaseListController {


    @RequestMapping(value = "paymentPage.ado")
    public ModelAndView urPurchaseList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pm_paymentList");
        return mv;
    }
}
