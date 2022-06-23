package kg.twojin.culturePark.admin.controller;


import kg.twojin.culturePark.common.vo.AdminVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class Page_Controller {


    @RequestMapping(value = "index.ado")
    public ModelAndView AdIndex(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common_index");
        HttpSession session = request.getSession();
        AdminVO vo = (AdminVO) session.getAttribute("admin");
        return mv;
    }

    @RequestMapping(value = "indexTable.ado")
    public ModelAndView AdTable() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common_table_index");
        return mv;
    }
}
