package kg.twojin.culturePark.admin.account.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Account_Ad_Controller {

    @RequestMapping(value = "/createAd.ado")
    public ModelAndView createAD() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_createAcount");
        return mv;
    }

    @RequestMapping(value = "/adminList.ado")
    public ModelAndView adminList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_adminList");
        return mv;
    }

    @RequestMapping(value = "/adminModi.ado")
    public ModelAndView modiAD() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_modi");
        return mv;
    }
}
