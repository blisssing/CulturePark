package kg.twojin.culturePark.common.dao;


import kg.twojin.culturePark.common.vo.MemberVO;

import java.util.List;

public interface MemberDAO {

    int insertMember(MemberVO memberVO);

    List<MemberVO> selectAllMember();

    String selectEmail(String userEmail);

    String selectNickName(String userNick);

}