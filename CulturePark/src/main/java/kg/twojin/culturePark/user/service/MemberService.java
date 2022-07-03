package kg.twojin.culturePark.user.service;


import org.springframework.stereotype.Service;


@Service
public interface MemberService {
    String getAccessToken(String authorize_code);

}
