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

    @RequestMapping(value="/findId.do")
    public ModelAndView getFindId(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id");
        return mv;
    }

    @RequestMapping(value="/findPw.do")
    public ModelAndView getFindPw(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw");
        return mv;
    }

    @RequestMapping(value="/findIdResult.do")
    public ModelAndView getFindIdResult(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id_result");
        return mv;
    }

    @RequestMapping(value="/findPwResult.do")
    public ModelAndView getFindPwResult(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw_result");
        return mv;
    }


}


