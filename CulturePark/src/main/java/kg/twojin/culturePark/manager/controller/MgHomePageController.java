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

    @RequestMapping(value = "/pdCreate.mdo")
    public ModelAndView mgPdCreate() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_create");
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


    @RequestMapping(value = "/qnaManage.mdo")
    public ModelAndView mgQnaManage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("qna_manage");
        return mv;
    }


}
