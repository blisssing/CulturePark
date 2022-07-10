package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.user.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
        System.out.println("#########" + code);

        // 위에서 만든 코드 아래에 코드 추가
        String access_Token = memberService.getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);

        HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###email#### : " + userInfo.get("email"));



        return "member/testPage";
    }


}
