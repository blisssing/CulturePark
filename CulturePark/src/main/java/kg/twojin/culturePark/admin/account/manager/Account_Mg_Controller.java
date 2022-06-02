package kg.twojin.culturePark.admin.account.manager;


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
}
