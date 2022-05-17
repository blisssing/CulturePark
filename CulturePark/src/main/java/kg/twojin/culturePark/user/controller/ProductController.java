package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

    @RequestMapping(value = "pdList.do")
    public ModelAndView getPdList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_ListPage");
        return mv;
    }

    @RequestMapping(value = "pdBoard.do")
    public ModelAndView getPdBoard() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_boardPage");
        return mv;
    }

    @RequestMapping(value = "getMaininfo.do")
    public ModelAndView getMainInfo() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_mainInfo");
        return mv;
    }

    @RequestMapping(value = "getExtrainfo.do")
    public ModelAndView getExtraInfo() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_extraInfo");
        return mv;
    }

    @RequestMapping(value = "getReviewinfo.do")
    public ModelAndView getReviewInfo() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_viewInfo");
        return mv;
    }

    @RequestMapping(value = "getPriceDetail.do")
    public ModelAndView getPriceDetail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_priceDetail");
        return mv;
    }



}
