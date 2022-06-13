package kg.twojin.culturePark.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Page_Controller {


    @RequestMapping(value = "index.ado")
    public ModelAndView AdIndex() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common_index");
        return mv;
    }

    @RequestMapping(value = "indexTable.ado")
    public ModelAndView AdTable() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common_table_index");
        return mv;
    }
}
