package kg.twojin.culturePark.admin.review.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewMenuController {


    @RequestMapping(value = "reviewListPage.ado")
    public ModelAndView reviewListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("rv_reviewPage");
        return mv;
    }

    @RequestMapping(value = "reviewReportPage.ado")
    public ModelAndView reviewReport() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("rv_reportList");
        return mv;
    }


}
