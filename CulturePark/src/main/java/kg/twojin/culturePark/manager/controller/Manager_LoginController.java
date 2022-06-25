package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.admin.service.Ad_ManagerListService;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.manager.service.ManagerLoginService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
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


    @RequestMapping(value = "/login.mdo")
    public ModelAndView mgLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main_login");
        return mv;
    }


    //Todo 마무리 작업 해줄 것
    @RequestMapping(value = "/loginProcByRoot.mdo")
    public String  mgLoginProcByRoot(@RequestBody PartnerVO partnerVO,
                            HttpServletResponse response, HttpServletRequest request)
                            throws IOException {

        partnerVO=managerLoginService.loginByPartner(partnerVO);
        HttpSession session = request.getSession();
        JSONObject jsonObject = new JSONObject();


        if (partnerVO != null) {
            session.setAttribute("partner", partnerVO);
            session.setAttribute("isLogOn", "root");
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/loginProcByManager.mdo")
    public void mgLoginProcByManager(@RequestBody ManagerVO managerVO,
                            HttpServletRequest request, HttpServletResponse response) {

        managerVO = managerLoginService.loginByManager(managerVO);
        JSONObject json = new JSONObject();

        HttpSession session = request.getSession();

        if (managerVO != null) {
            session.setAttribute("isLogOn", "normal");
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
