package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.admin.service.Ad_ManagerListService;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.manager.service.ManagerLoginService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@RestController
public class Manager_LoginController {

    @Autowired
    ManagerLoginService managerLoginService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;


    @RequestMapping(value = "/login.mdo")
    public ModelAndView mgLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_login");
        return mv;
    }


    @RequestMapping(value = "/loginProc.mdo")
    public String  mgLoginProcByManager(@ModelAttribute ManagerVO managerVO,
                            HttpServletRequest request, HttpServletResponse response) {

        String pw = managerVO.getMg_pw();
        managerVO = managerLoginService.loginManager(managerVO);

        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();

        if (managerVO != null) {

            if (passwordEncoder.matches(pw, managerVO.getMg_pw())) {
                session.setAttribute("isLogOn", managerVO.getMg_is());
                session.setAttribute("manager", managerVO);
                return "success";
            } else {
                return "wrongPW";
            }
        } else {
            return "failed";
        }

    }


    @RequestMapping(value = "/findId.mdo")
    public ModelAndView mgFindId() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_id");
        return mv;
    }

    @RequestMapping(value = "/findPw.mdo")
    public ModelAndView mgFindPw() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_pw");
        return mv;
    }

    @RequestMapping(value = "/findIdResult.mdo")
    public ModelAndView mgFindIdResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_id_result");
        return mv;
    }

    @RequestMapping(value = "/findPwResult.mdo")
    public ModelAndView mgFindPwResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_find_pw_result");
        return mv;
    }

    @RequestMapping(value = "/changePw.mdo")
    public ModelAndView mgChangePw() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("my_change_pw");
        return mv;
    }

}
