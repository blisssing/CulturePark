package kg.twojin.culturePark.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_PD_Controller {


    @RequestMapping(value = "pdList.ado")
    public ModelAndView pdManageList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_progressList");
        return mv;
    }

    @RequestMapping(value = "pdDetail.ado")
    public ModelAndView pdDetail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_detailPage");
        return mv;
    }
}
