package kg.twojin.culturePark.controller.user;


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

    @RequestMapping(value = "/museumMain.do")
    public ModelAndView getMuseumPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_museumPage");
        return mv;
    }

    @RequestMapping(value = "/myPage.do")
    public ModelAndView getMypage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_myTicket");
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

    @RequestMapping(value = "/login.do")
    public ModelAndView getLoginPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_login");
        return mv;
    }

    @RequestMapping(value = "/join.do")
    public ModelAndView getJoinPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_join");
        return mv;
    }

    @RequestMapping(value = "/servicePage.do")
    public ModelAndView getServicePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("service_faqPage");
        return mv;
    }




}


