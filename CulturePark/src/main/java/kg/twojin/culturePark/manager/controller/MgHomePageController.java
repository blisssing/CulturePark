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






}
