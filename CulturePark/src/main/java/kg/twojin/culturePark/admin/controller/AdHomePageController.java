package kg.twojin.culturePark.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdHomePageController {


    @RequestMapping(value = "index.ado")
    public ModelAndView AdIndex() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_index");
        return mv;
    }

    @RequestMapping(value = "login.ado")
    public ModelAndView AdLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_login");
        return mv;
    }

    @RequestMapping(value = "createAd.ado")
    public ModelAndView AdCreate() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_createAcount");
        return mv;
    }
}
