package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewPageController {

    @RequestMapping(value = "reviewBoard.do")
    public ModelAndView getReview() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("review_boardPage");
        return mv;
    }

    @RequestMapping(value = "writeReview.do")
    public ModelAndView createReview() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("");
        return mv;
    }
}