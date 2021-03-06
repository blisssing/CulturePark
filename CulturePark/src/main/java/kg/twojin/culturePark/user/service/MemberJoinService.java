package kg.twojin.culturePark.user.service;

import kg.twojin.culturePark.common.vo.MemberVO;


public interface MemberJoinService {

    int joinMember(MemberVO memberVO);

    int joinUpdateMember(MemberVO memberVO);

    void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

    String searchEmailAddress(String userEmail);

    String searchNickname(String userNick);

}

