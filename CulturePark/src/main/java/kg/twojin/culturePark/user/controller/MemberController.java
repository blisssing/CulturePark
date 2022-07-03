package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.user.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
/*@RequestMapping(value="/member/*")*/
public class MemberController {


    @Autowired
    public MemberService ms;

    @RequestMapping(value="/kakaoLogin", method=RequestMethod.POST)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
        System.out.println("#########" + code);

        // 위에서 만든 코드 아래에 코드 추가
        String access_Token = ms.getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);

        return access_Token;
    }


}
