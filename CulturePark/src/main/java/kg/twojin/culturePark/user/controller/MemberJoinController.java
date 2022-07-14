package kg.twojin.culturePark.user.controller;


import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.user.service.MemberJoinService;
import kg.twojin.culturePark.user.service.MemberKakaoService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MemberJoinController {

    @Autowired
    private HttpSession session;

    @Autowired
    MemberJoinService memberJoinService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private MemberKakaoService memberKakaoService;



    // ID 중복 조회
    @RequestMapping(value = "/culturePark/chkEmail.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkEmail(@RequestParam("mb_email") String mb_email, HttpServletResponse response) {

        String result = memberJoinService.searchEmailAddress(mb_email);
        return result;
    }

    // 닉네임 중복 조회
    @RequestMapping(value = "/culturePark/chkNickProc.do")
    @ResponseBody
    public String checkNickname(@RequestParam("mb_nick") String mb_nick, HttpServletResponse response) {

        String result = memberJoinService.searchNickname(mb_nick);
        return result;
    }

    // 인증 문자 보내기
    @RequestMapping(value = "/culturePark/chkPhone.do", method = RequestMethod.POST)
    @ResponseBody
    public String sendSms(@RequestParam("phone") String phoneNumber, HttpServletResponse response) throws Exception {

        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000); // 난수 생성
        memberJoinService.certifiedPhoneNumber(phoneNumber, randomNumber);
        return Integer.toString(randomNumber);
    }


    // 계정 생성하기
    @RequestMapping(value = "/culturePark/createUserProc.do", method = RequestMethod.POST)
    public void createUser(@RequestBody MemberVO memberVO,
                           HttpServletResponse response ) throws IOException   {


        System.out.println("실행확인");
        String result_str;

        // 암호화
        String pw = memberVO.getMb_pw();
        String encodePw = passwordEncoder.encode(pw);

        // 생성날짜

        Date date = new Date();

        memberVO.setMb_createDate(date);
        memberVO.setMb_pw(encodePw);

        int result = memberJoinService.joinMember(memberVO);
        System.out.println(result);

        JSONObject json = new JSONObject();

        if (result == 0) {
            result_str = "failed";
        } else {
            result_str = "success";
        }

        json.put("result", result_str);

        PrintWriter out = response.getWriter();
        out.print(json);
    }

    @ResponseBody
    @RequestMapping(value = "/kakaoJoinProc.do", method = RequestMethod.POST)
    public String kakaoJoinProc(@RequestBody MemberVO vo,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        String result;
        String kakaoJoin;
        String voTel = vo.getMb_tel();

        vo = memberKakaoService.selectExistTel_kakao(vo);

        if(vo != null) {
            String dbTel = vo.getMb_tel();

            if (dbTel.equals(voTel)) {
                result = "success";
                System.out.println("success"+"dbTel"+dbTel+"voTel"+voTel);
            } else {
                result = "wrongTel";
                kakaoJoin = "ok";

                session.setAttribute("newMember",kakaoJoin);
                System.out.println("wrongTel"+"dbTel"+dbTel+"voTel"+voTel);
            }
        }else {
            result = "failed";
        }
        return result;
    }

    // 카카오api로 계정 update
    @RequestMapping(value = "/culturePark/updateUserProc.do", method = RequestMethod.POST)
    public void updateUser(@RequestBody MemberVO memberVO,
                           HttpServletResponse response ) throws IOException   {


        System.out.println("실행확인");
        String result_str;

        // 암호화
        String pw = memberVO.getMb_pw();
        String encodePw = passwordEncoder.encode(pw);

        // 생성날짜
      /*  Date date = new Date();

        memberVO.setMb_createDate(date);*/
        memberVO.setMb_pw(encodePw);

        int result = memberJoinService.joinUpdateMember(memberVO);
        System.out.println(result);

        JSONObject json = new JSONObject();

        if (result == 0) {
            result_str = "failed";
        } else {
            result_str = "success";
        }

        json.put("result", result_str);

        PrintWriter out = response.getWriter();
        out.print(json);
    }

    // kakao table로 셋팅
    @RequestMapping(value = "/culturePark/createKakaoUserProc.do", method = RequestMethod.POST)
    public void createKakaoUser(@RequestBody MemberVO memberVO, String mb_email, String kmb_status,
                                HttpServletResponse response ) throws IOException   {


        System.out.println("실행확인");
        String result_str;

        int result = memberJoinService.joinMember(memberVO);
        System.out.println(result);

        JSONObject json = new JSONObject();
        HashMap<String, Object> map = new HashMap<>();

        if (result == 0) {
            result_str = "failed";
        } else {
            result_str = "success";
        }
            map.put("kmb_email", mb_email);
            map.put("kmb_status", kmb_status);

        json.put("result", result_str);

        PrintWriter out = response.getWriter();
        out.print(json);
    }

}