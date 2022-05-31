package kg.twojin.culturePark.manager.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MdHomePageController {


    @RequestMapping(value = "/index.mdo")
    public ModelAndView mdHomePage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("md_index");
        return mv;
    }
}
