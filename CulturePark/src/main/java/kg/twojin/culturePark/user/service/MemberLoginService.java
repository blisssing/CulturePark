package kg.twojin.culturePark.user.service;

import kg.twojin.culturePark.common.vo.MemberVO;

import java.util.List;


public interface MemberLoginService {

    MemberVO memberLogin(MemberVO memberVO);

    MemberVO memberFindId(MemberVO memberVO);

    MemberVO memberFindPw_Email(MemberVO memberVO);

    MemberVO memberFindPw_Phone(MemberVO memberVO);

    void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

}
