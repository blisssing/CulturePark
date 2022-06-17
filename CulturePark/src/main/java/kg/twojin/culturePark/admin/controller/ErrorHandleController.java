package kg.twojin.culturePark.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ErrorHandleController {

    @RequestMapping("/accessError.ado")
    public ModelAndView accessError(HttpServletResponse response, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("accessError");
        return mv;
    }


}
