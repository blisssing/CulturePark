package kg.twojin.culturePark.admin.controller;


import kg.twojin.culturePark.admin.dao.AdminDAO;
import kg.twojin.culturePark.admin.service.AdminManageService;
import kg.twojin.culturePark.admin.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

@Controller
public class Account_Ad_Controller {

    @Autowired
    AdminDAO adminDAO ;

    @Autowired
    AdminManageService adminManageService;

    @RequestMapping(value = "/createAd.ado")
    public ModelAndView createAd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_createAccount");
        return mv;
    }

    @RequestMapping(value = "/createAdProc.ado")
    public ModelAndView createAdProc(
            // 1번 방법
//                            @RequestParam("ad_email") String ad_email,
//                            @RequestParam("ad_pw") String ad_pW,
//                            @RequestParam("ad_tel") String ad_tel,
//                            @RequestParam("ad_depart") String ad_depart,
//                            @RequestParam("ad_right") String ad_right,
            // 2번 방법
                            @ModelAttribute("adminVO") AdminVO adminVO,
                            HttpServletResponse response , HttpServletRequest request) {

        // 1번 방법
//        AdminVO vo = new AdminVO();
//            vo.setAd_email(ad_email);
//            vo.setAd_pw(ad_pW);
//            vo.setAd_tel(ad_tel);
//            vo.setAd_depart(ad_depart);
//            vo.setAd_is(ad_right);

        System.out.println("Proc 실행!");
        ModelAndView mv = new ModelAndView("redirect:/adminList.ado");
        int result = adminManageService.insertAdmin(adminVO);
        return mv;
    }


    @RequestMapping(value = "/adminList.ado")
    public ModelAndView adminList(HttpServletRequest request , HttpServletResponse response) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<AdminVO> adminList = adminManageService.selectAllAdmins();
        mv.addObject("adminList", adminList);
        mv.setViewName("ad_adminList");
        return mv;
    }

    @RequestMapping(value = "/adminModi.ado")
    public ModelAndView modiAD() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_modi");
        return mv;
    }
}
