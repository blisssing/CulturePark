package kg.twojin.culturePark.user.controller;


import kg.twojin.culturePark.user.service.MemberJoinService;
import net.nurigo.java_sdk.api.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@Controller
public class MemberJoinController {

    @Autowired
    MemberJoinService memberJoinService;

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

        String result =memberJoinService.searchNickname(mb_nick);
        System.out.println(result);
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

}
