package kg.twojin.culturePark.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookingPageController {

    @RequestMapping(value = "/bookIndex.do")
    public ModelAndView bookIndex() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("booking_index");
        return mv;
    }

    @RequestMapping(value = "book01.do")
    public ModelAndView bookLvOne() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("booking_lv_01");
        return mv;
    }

    @RequestMapping(value = "book02.do")
    public ModelAndView bookLvTwo() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("booking_lv_02");
        return mv;
    }

    @RequestMapping(value = "book03.do")
    public ModelAndView bookLvTrd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("booking_lv_03");
        return mv;
    }

    @RequestMapping(value = "book04.do")
    public ModelAndView bookLvFth() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("booking_lv_04");
        return mv;
    }

    @RequestMapping(value = "bookSuc.do")
    public ModelAndView bookDone() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("booking_lv_success");
        return mv;
    }
}
