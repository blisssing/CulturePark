package kg.twojin.culturePark.manager.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MgHomePageController {


    @RequestMapping(value = "/index.mdo")
    public ModelAndView mgHomePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common_index");
        return mv;
    }

    @RequestMapping(value = "/login.mdo")
    public ModelAndView mgLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_login");
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

    @RequestMapping(value = "/pdEx.mdo")
    public ModelAndView mgPdEx() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_ex");
        return mv;
    }

    @RequestMapping(value = "/pdMu.mdo")
    public ModelAndView mgPdMu() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_mu");
        return mv;
    }

    @RequestMapping(value = "/refuse.mdo")
    public ModelAndView mgRefuse() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_refuse_pop");
        return mv;
    }

    @RequestMapping(value = "/adminInfo.mdo")
    public ModelAndView mgManagerInfo() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_adminInfo_pop");
        return mv;
    }

    @RequestMapping(value = "/mAccountList.mdo")
    public ModelAndView mgMAccountList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("m_account_list");
        return mv;
    }

    @RequestMapping(value = "/mAccountAdd.mdo")
    public ModelAndView mgMAccountAdd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("m_account_add");
        return mv;
    }

}
