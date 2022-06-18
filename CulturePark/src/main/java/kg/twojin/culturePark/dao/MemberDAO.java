package kg.twojin.culturePark.dao;


import kg.twojin.culturePark.vo.MemberVO;

public interface MemberDAO {

    int createMember(MemberVO memberVO);

    String selectEmail(String userEmail);

    String selectNickName(String userNick);

}
