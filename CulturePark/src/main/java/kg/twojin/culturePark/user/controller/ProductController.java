package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

    @RequestMapping(value = "pdList.do")
    public ModelAndView getPdList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_ListPage");
        return mv;
    }

}
