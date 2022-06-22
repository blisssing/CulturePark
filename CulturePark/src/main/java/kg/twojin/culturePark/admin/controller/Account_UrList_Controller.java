package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.Ad_UserListService;
import kg.twojin.culturePark.admin.service.EmailService;
import kg.twojin.culturePark.admin.service.SecurityService;
import kg.twojin.culturePark.common.vo.EmailVO;
import kg.twojin.culturePark.common.vo.MemberVO;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@RestController
public class Account_UrList_Controller {

    @Autowired
    Ad_UserListService ad_userListService;

    @Autowired
    SecurityService securityService;

    @Autowired
    EmailService emailService;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;


    @RequestMapping(value = "memberListPage.ado")
    public ModelAndView memberList(HttpServletResponse response, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        List<MemberVO> memberVOList = ad_userListService.getMemberList();

        mv.addObject("memberVOList", memberVOList);
        mv.setViewName("ur_memberList");

        return mv;
    }

    // 활성화 비활성화 전환
    @RequestMapping(value = "changeMbActive.ado")
    public void changeMbActive(HttpServletRequest request, HttpServletResponse response,
                               @RequestBody MemberVO memberVO) throws IOException {

        int result = ad_userListService.updateMemberActive(memberVO);
        JSONObject json = new JSONObject();
        String result_str = "";


        if (result == 1) {
            result_str = "success";
        } else {
            result_str = "failed";
        }


        json.put("result", result_str);
        PrintWriter writer = response.getWriter();
        writer.print(json);
    }

    // 임시키 발급
    @RequestMapping(value = "getTemporaryKey.ado")
    public void getTemporaryKey(@RequestBody MemberVO memberVO,
                                HttpServletResponse response) throws IOException {

        // 멤버필드

        JSONObject json = new JSONObject();
        EmailVO emailVO;

        // 임시키 생성
        String tempKey = securityService.createTempKeyBySec(); // 임시키
        String encodeKey = bcryptPasswordEncoder.encode(tempKey); // 암호화
        System.out.println("암호화 키 : " + encodeKey);

        // 메일 내용 구성 -> vo 생성

        String subject = "[CulturePark] " + memberVO.getMb_nick() + "님의 임시비밀번호 발급";
        String text = tempKey;
        emailVO = new EmailVO(memberVO.getMb_email(), subject, text);


        // DB에 임시키 발급
        int result = ad_userListService.modifyMemberPassword(memberVO.getMb_email(), encodeKey);

        if (result == 1) {
            boolean email_result = emailService.sendEmail(emailVO); // 성공하면 이메일 발송
            if (email_result) {
                json.put("result", "success");
                System.out.println(email_result);
            } else {
                json.put("result", "failed");
            }
        } else {
            json.put("result", "failed");
        }

        PrintWriter out = response.getWriter();
        out.print(json);
    }

    // 유저 징계
    @RequestMapping(value = "/setMemberPause.ado")
    public void setMemberPause(@RequestBody Map<String,String> param,
                               HttpServletResponse response) throws IOException{

        int mb_seq = Integer.parseInt(param.get("mb_seq"));
        String pause_date = param.get("pause_date");
        String pause_reason = param.get("pause_reason");

        int result = ad_userListService.updateMemberPause(mb_seq, pause_date, pause_reason);
        JSONObject json = new JSONObject();
        PrintWriter writer = response.getWriter();
        if (result == 1) {
            json.put("result", "success");
        } else {
            json.put("result", "failed");
        }
        writer.print(json);
    }
}