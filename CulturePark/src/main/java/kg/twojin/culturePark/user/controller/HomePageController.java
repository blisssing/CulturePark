package kg.twojin.culturePark.user.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomePageController {

    @RequestMapping(value = "/home.do")
    public ModelAndView getHomePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_homePage");
        return mv;
    }



}
