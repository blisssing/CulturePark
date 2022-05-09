package kg.twojin.culturePark.common.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

    @RequestMapping(value = "test.mdo")
    public ModelAndView returnview() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("test");
        return mv;
    }
}
