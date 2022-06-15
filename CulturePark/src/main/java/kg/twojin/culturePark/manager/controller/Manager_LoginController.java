package kg.twojin.culturePark.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Manager_LoginController {

    @RequestMapping(value = "/login.mdo")
    public ModelAndView mgLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_login_Form");
        return mv;
    }

    @RequestMapping(value = "/findId.mdo")
    public ModelAndView mgFindId() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_id");
        return mv;
    }

    @RequestMapping(value = "/findPw.mdo")
    public ModelAndView mgFindPw() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_pw");
        return mv;
    }

    @RequestMapping(value = "/findIdResult.mdo")
    public ModelAndView mgFindIdResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_id_result");
        return mv;
    }

    @RequestMapping(value = "/findPwResult.mdo")
    public ModelAndView mgFindPwResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_pw_result");
        return mv;
    }

    @RequestMapping(value = "/changePw.mdo")
    public ModelAndView mgChangePw() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("my_change_pw");
        return mv;
    }

}
