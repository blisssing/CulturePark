package kg.twojin.culturePark.admin.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminPdController {

    @RequestMapping(value = "pdCreateRequest.ado")
    public ModelAndView pdCreateRequest() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_createRequest");
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
}
