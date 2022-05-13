package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

    @RequestMapping(value = "/myTicket.do")
    public ModelAndView getMyTicket() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myTicket");
        return mv;
    }


}
