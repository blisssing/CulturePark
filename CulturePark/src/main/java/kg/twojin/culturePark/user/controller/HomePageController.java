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

    @RequestMapping(value = "/exhibitMain.do")
    public ModelAndView getExhibitPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_exhibitPage");
        return mv;
    }

    @RequestMapping(value = "/musiumPage.do")
    public ModelAndView getMusiumPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_musiumPage");
        return mv;
    }

    @RequestMapping(value="/myPage.do")
    public ModelAndView goToMypage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage");
        return mv;
    }






}
