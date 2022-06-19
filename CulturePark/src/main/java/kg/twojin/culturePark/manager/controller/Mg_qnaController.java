package kg.twojin.culturePark.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Mg_qnaController {

    @RequestMapping(value = "/qnaManage.mdo")
    public ModelAndView mgQnaManage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("qna_manage");
        return mv;
    }


}
