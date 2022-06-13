package kg.twojin.culturePark.controller.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

    @RequestMapping(value = "/login.do")
    public ModelAndView getLoginPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_login");
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
