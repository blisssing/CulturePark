package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

    @RequestMapping(value = "/myTicket.do")
    public ModelAndView getMyTicket() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_myTicket");
        return mv;
    }

    @RequestMapping(value = "/viewDetail.do")
    public ModelAndView getViewDetail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_viewDetail");
        return mv;
    }

    @RequestMapping(value = "/viewTicket.do")
    public ModelAndView getViewTicket() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_viewTicket");
        return mv;
    }

    @RequestMapping(value = "/viewCancel.do")
    public ModelAndView getViewCancel() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_viewCancel");
        return mv;
    }

}
