package kg.twojin.culturePark.controller.admin.account;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Account_Mg_Controller {

    @RequestMapping(value = "mgRequest.ado")
    public ModelAndView mgRequestList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("mg_requestList");
        return mv;
    }

    @RequestMapping(value = "mgPartner.ado")
    public ModelAndView partnerList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("mg_partnerList");
        return mv;
    }

    @RequestMapping(value = "mgManager.ado")
    public ModelAndView mgList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("mg_managerList");
        return mv;
    }
}
