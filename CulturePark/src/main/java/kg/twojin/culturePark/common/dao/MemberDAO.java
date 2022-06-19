package kg.twojin.culturePark.common.dao;


import kg.twojin.culturePark.common.vo.MemberVO;

public interface MemberDAO {

    int createMember(MemberVO memberVO);

    String selectEmail(String userEmail);

    String selectNickName(String userNick);

}
