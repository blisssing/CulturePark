package kg.twojin.culturePark.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Mg_manageController {

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


}
