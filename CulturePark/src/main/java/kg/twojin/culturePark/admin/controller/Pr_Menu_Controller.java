// 프로모션 컨트롤러
package kg.twojin.culturePark.admin.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Pr_Menu_Controller {


    @RequestMapping(value = "createProm.ado")
    public ModelAndView createProm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pr_createPage");
        return mv;
    }

    @RequestMapping(value = "ingProm.ado")
    public ModelAndView progProm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pr_promList");
        return mv;
    }

    @RequestMapping(value = "expirProm.ado")
    public ModelAndView expirProm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pr_expirList");
        return mv;
    }

    @RequestMapping(value = "requestProm.ado")
    public ModelAndView requestProm() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pr_requestList");
        return mv;
    }
}
