package kg.twojin.culturePark.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_PD_Controller {

    @RequestMapping(value = "/pdNewList.ado")
    public ModelAndView pdCreateRequest() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_newList");
        return mv;
    }

    @RequestMapping(value = "pdModifyRequest.ado")
    public ModelAndView pdModifyRequest() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_modiRequest");
        return mv;
    }

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
