package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.Ad_ManagerListService;
import kg.twojin.culturePark.common.vo.ManagerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class Mg_ManagerListController {

    @Autowired
    Ad_ManagerListService ad_managerListService;


    @RequestMapping(value = "mgManager.ado")
    public ModelAndView managerList(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        List <ManagerVO> managerList = ad_managerListService.getManagerList();

        if (managerList != null) {
            mv.addObject("managerList", managerList);
            mv.setViewName("mg_managerList");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("Error", "Proc");
            mv.setViewName("accessError.jsp");
        }
        return mv;
    }

}
