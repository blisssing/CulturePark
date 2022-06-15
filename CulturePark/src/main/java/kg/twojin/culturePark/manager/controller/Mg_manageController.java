package kg.twojin.culturePark.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Mg_manageController {


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

}
