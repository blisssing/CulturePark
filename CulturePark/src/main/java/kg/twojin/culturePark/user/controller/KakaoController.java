package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.user.service.KakaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoController {

        @Autowired
        private KakaoService kakaoService;

        @RequestMapping("/testLogin.do")
        public void home(@RequestParam(value = "code", required = false) String code) throws Exception{
            System.out.println("#########\n" + code);
            String access_Token = kakaoService.getAccessToken(code);
            System.out.println("###access_Token#### : " + access_Token);

        }

    }

