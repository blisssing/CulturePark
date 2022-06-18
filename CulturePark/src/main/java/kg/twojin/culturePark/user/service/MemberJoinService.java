package kg.twojin.culturePark.user.service;

import kg.twojin.culturePark.vo.MemberVO;


public interface MemberJoinService {

    int joinMember(MemberVO memberVO);

    void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

    String searchEmailAddress(String userEmail);

    String searchNickname(String userNick);
}
