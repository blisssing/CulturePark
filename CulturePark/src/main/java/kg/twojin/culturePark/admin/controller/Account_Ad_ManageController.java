package kg.twojin.culturePark.admin.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import kg.twojin.culturePark.common.dao.AdminDAO;
import kg.twojin.culturePark.admin.service.AdminManageService;
import kg.twojin.culturePark.common.vo.AdminVO;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class Account_Ad_ManageController {

    @Autowired
    AdminDAO adminDAO;

    @Autowired
    AdminManageService adminManageService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;



    // 계정목록
    @RequestMapping(value = "/adminList.ado")
    public ModelAndView adminList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<AdminVO> adminList = adminManageService.getAdminList();

        mv.addObject("adminList", adminList);
        mv.setViewName("ad_adminList");
        return mv;

        /*if (adminList != null) {
            int length = adminList.size();
            for (int i = 0; i < length; i++) {
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String str= simpleDateFormat.format(adminList.get(i).getAd_createDate());
                Date date = new Date(str);
                adminList.get(i).setAd_createDate(date);
            }
        }*/
    }


    // 계정수정
    @RequestMapping(value = "/updateAdminProc.ado")
    public ModelAndView updateAdmin(HttpServletRequest request, HttpServletResponse response,
                                    @ModelAttribute("adminVO") AdminVO adminVO, @RequestParam List <String> check_is) throws IOException {

        System.out.println("수행 확인");

        // 셋팅
        ModelAndView mv = new ModelAndView();
        int result;
        int chk_len;
        String chk_str;

        chk_len = check_is.size();
        chk_str= "";

        for (int i = 0; i < chk_len; i++) {

            if (i > 0) {
                chk_str += "/" + check_is.get(i);
            } else {
                chk_str += check_is.get(i);
            }
        }

        // 권한 문자열 셋팅
        adminVO.setAd_is(chk_str);

        if (!adminVO.getAd_pw().trim().equals("")) {
            String encodePw= passwordEncoder.encode(adminVO.getAd_pw());
            adminVO.setAd_pw(encodePw);
            result=adminManageService.updateAdminWithPw(adminVO);
        } else {
            result=adminManageService.updateAdminWithoutPw(adminVO);
        }

        if (result == 1) {
            mv.setViewName("redirect:/adminList.ado");
        } else { // 비정상실행
            mv.setViewName("redirect:/index.ado");
        }

        return mv;
    }


    // 계정삭제

    @RequestMapping(value = "/deleteAdminProc.ado")
    public ModelAndView deleteAdmin(HttpServletRequest request, HttpServletResponse response,
                                    @ModelAttribute("adminVO") AdminVO adminVO) {
        ModelAndView mv = new ModelAndView();

        System.out.println("동작 확인");
        int result = adminManageService.removeAdmin(adminVO);

        if (result != 1) {
            System.out.println("삭제실패");
            mv.setViewName("redirect:/index.ado");
        } else {
            System.out.println("삭제 성공");
            mv.setViewName("redirect:/adminList.ado");
        }
        return mv;
    }

    // 계정 정보

    @ResponseBody
    @RequestMapping(value = "/getAdminInfo.ado", method = RequestMethod.POST)
    public void getAdminInfoProc(@RequestParam int ad_seq,
                                 HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        AdminVO vo = adminManageService.getAdminInfo(ad_seq);

        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(vo);
        //  == >{"ad_email":"taran0913@naver.com","ad_pw":null,"ad_name":"한진희","ad_tel":"010-4444-4444","ad_is":null,"ad_depart":null,"ad_createDate":null,"ad_seq":11}

        PrintWriter writer = response.getWriter();
        writer.print(jsonString);
    }

}
