package kg.twojin.culturePark.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Mg_accountController {

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
