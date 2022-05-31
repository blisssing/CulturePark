package kg.twojin.culturePark.user.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyInfoController {

    @RequestMapping(value = "modiInfo.do")
    public ModelAndView modiInfo() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_modiInfo");
        return mv;
    }
}
