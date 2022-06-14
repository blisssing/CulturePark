package kg.twojin.culturePark.admin.controller;


import kg.twojin.culturePark.admin.dao.AdminDAO;
import kg.twojin.culturePark.admin.service.AdminManageService;
import kg.twojin.culturePark.admin.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    // 계정생성 페이지 들어오기
    @RequestMapping(value = "/createAd.ado")
    public ModelAndView createAd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_createAccount");
        return mv;
    }

    // 계정생성 동작 수행
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
                            @RequestParam List <String> check_is,
                            HttpServletResponse response , HttpServletRequest request) {

        // 1번 방법
//        AdminVO vo = new AdminVO();
//            vo.setAd_email(ad_email);
//            vo.setAd_pw(ad_pW);
//            vo.setAd_tel(ad_tel);
//            vo.setAd_depart(ad_depart);
//            vo.setAd_is(ad_right);

        System.out.println("Proc 실행!");
        //암호화 작업


            // 입력 받은 암호 문자열
            String password = adminVO.getAd_pw();

            // Security Encoder 를 활용한 암호화
            String encryptPassword = passwordEncoder.encode(password);

            // 암호화 한 비밀번호를 vo에 셋팅
            adminVO.setAd_pw(encryptPassword);

        //  권환 확인

        int chk_len = check_is.size();
        String chk_str = "";

        for (int i = 0; i < chk_len; i++) {

            if (i > 0) {
                chk_str += "/" + check_is.get(i);
            } else {
                chk_str += check_is.get(i);
            }
        }
        // 권한 문자열 셋팅
        adminVO.setAd_is(chk_str);

        // db에 넣어주기
        int result = adminManageService.insertAdmin(adminVO);
        ModelAndView mv = new ModelAndView();

        // 결과에 따른 페이지 이동 (성공/실패)
        if (result == 1) {
            mv.setViewName("redirect:/adminList.ado");
        } else {
            mv.setViewName("redirect:/createAd.ado");
        }
        return mv;
    }


    @RequestMapping(value = "/adminList.ado")
    public ModelAndView adminList(HttpServletRequest request , HttpServletResponse response) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<AdminVO> adminList = adminManageService.adminList();
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
