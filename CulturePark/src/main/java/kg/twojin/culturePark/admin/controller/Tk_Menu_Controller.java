// 티켓 컨트롤러
package kg.twojin.culturePark.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Tk_Menu_Controller {


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
