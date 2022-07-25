package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberJoinService;
import kg.twojin.culturePark.user.service.MemberKakaoService;
import kg.twojin.culturePark.user.service.MemberLoginService;
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

    @Autowired
    private MemberJoinService memberJoinService;

    @Autowired
    private MemberLoginService memberLoginService;


    @RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {

            // 위에서 만든 코드 아래에 코드 추가
            String access_token = memberKakaoService.getAccessToken(code);
            /* System.out.println("###access_Token#### : " + access_token); */

            HashMap<String, Object> userInfo = memberKakaoService.getUserInfo(access_token);

            /* System.out.println("###access_Token#### : " + access_token);
               System.out.println("###nickname#### : " + userInfo.get("nickname"));
               System.out.println("###email#### : " + userInfo.get("email")); */

            session.setAttribute("kakaoN", userInfo.get("nickname"));
            session.setAttribute("kakaoE", userInfo.get("email"));

            String mb_email = (String) userInfo.get("email");


            MemberVO vo = new MemberVO();
            vo.setMb_email(mb_email);


            // 카카오테이블 이메일 검색
            String kakaoMemberExist = memberJoinService.kakaoMemberExistEmail(vo);


            if (kakaoMemberExist != null) {

                vo = memberLoginService.memberLogin(vo);
                session.setAttribute("member",vo);

                return "main_homePage";

            } else{

                return "member_kakaoJoin";
            }

        /*if (existKakaoMember != null) {
            session.setAttribute("member", existKakaoMember);
            //Todo : 일반회원 로그인할 때는 normal로 띄워줄 것
            session.setAttribute("memberIs", "kakao");
            session.setAttribute("loginChk", "logOn");

            return "/main_homePage";*/
    }
}
