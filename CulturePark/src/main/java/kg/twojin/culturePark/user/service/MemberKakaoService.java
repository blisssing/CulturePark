package kg.twojin.culturePark.user.service;


import kg.twojin.culturePark.common.vo.MemberVO;
import org.springframework.stereotype.Service;

import java.util.HashMap;


public interface MemberKakaoService {
    String getAccessToken(String authorize_code);

    HashMap<String, Object> getUserInfo(String access_token);

    MemberVO selectExistTel_kakao(MemberVO vo);
}
