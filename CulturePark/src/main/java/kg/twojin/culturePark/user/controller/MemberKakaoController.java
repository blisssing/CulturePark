package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.user.service.MemberKakaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping(value="/member/*")
public class MemberKakaoController {


    @Autowired
    private HttpSession session;

    @Autowired
    private MemberKakaoService memberKakaoService;


    @RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
       /* System.out.println("#########" + code);*/

        // 위에서 만든 코드 아래에 코드 추가
        String access_token = memberKakaoService.getAccessToken(code);
       /* System.out.println("###access_Token#### : " + access_token);*/

        HashMap<String, Object> userInfo = memberKakaoService.getUserInfo(access_token);
      /*  System.out.println("###access_Token#### : " + access_token);
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###email#### : " + userInfo.get("email"));*/


        session.setAttribute("kakaoN", userInfo.get("nickname"));
        session.setAttribute("kakaoE", userInfo.get("email"));


       /* int result2 = memberKakaoService.selectExistEmail(userInfo.get("email"));
        return home.do;*/



        return "member_kakaoJoin";
    }


}
