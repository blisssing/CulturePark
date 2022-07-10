package kg.twojin.culturePark.user.service;


import org.springframework.stereotype.Service;

import java.util.HashMap;


public interface MemberService {
    String getAccessToken(String authorize_code);

    HashMap<String, Object> getUserInfo(String access_token);
}
