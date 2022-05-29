package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SellerPageController {

    @RequestMapping(value = "registSeller.do")
    public ModelAndView registSeller() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("seller_regist");
        return mv;
    }
}
