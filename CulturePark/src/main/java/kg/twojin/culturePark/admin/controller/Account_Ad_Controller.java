package kg.twojin.culturePark.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Account_Ad_Controller {


    @RequestMapping(value = "/createAd.ado")
    public ModelAndView AdCreate() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_createAcount");
        return mv;
    }
}
