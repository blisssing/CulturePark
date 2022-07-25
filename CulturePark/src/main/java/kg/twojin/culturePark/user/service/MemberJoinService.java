package kg.twojin.culturePark.user.service;

import kg.twojin.culturePark.common.vo.MemberVO;


public interface MemberJoinService {

    int joinMember(MemberVO memberVO);

    MemberVO integrateMember(MemberVO memberVO);

    MemberVO newKakaoJoinMember(MemberVO memberVO);

    String kakaoMemberExistEmail(MemberVO memberVO);

    void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

    String searchEmailAddress(String userEmail);

    String searchNickname(String userNick);

}

