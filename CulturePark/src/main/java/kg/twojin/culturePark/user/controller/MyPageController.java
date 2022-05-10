package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

@RequestMapping(value="/myPage.do")
    public ModelAndView goToMypage(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage");
        return mv;
    }
}