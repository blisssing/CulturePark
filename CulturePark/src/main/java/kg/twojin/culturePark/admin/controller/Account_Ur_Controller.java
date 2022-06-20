package kg.twojin.culturePark.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Account_Ur_Controller {






    @RequestMapping(value = "questionPage.ado")
    public ModelAndView questionPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ur_questionList");
        return mv;
    }

    @RequestMapping(value = "reportPage.ado")
    public ModelAndView reportPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("rv_reportList");
        return mv;
    }

    @RequestMapping(value = "dicipPage.ado")
    public ModelAndView dicipPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ur_dicipList");
        return mv;
    }
}
