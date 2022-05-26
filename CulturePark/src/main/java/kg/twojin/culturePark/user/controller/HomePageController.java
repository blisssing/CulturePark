package kg.twojin.culturePark.user.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping(value = "/museumMain.do")
    public ModelAndView getMusiumPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_museumPage");
        return mv;
    }

    @RequestMapping(value = "/myPage.do")
    public ModelAndView getMypage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage");
        return mv;
    }


    @RequestMapping(value = "/reviewPage.do")
    public ModelAndView getReviewPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("review_listPage");
        return mv;
    }

    @RequestMapping(value = "/rankPage.do")
    public ModelAndView getRankpage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_rankPage");
        return mv;
    }

}


