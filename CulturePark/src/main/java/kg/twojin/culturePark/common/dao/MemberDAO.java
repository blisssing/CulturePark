package kg.twojin.culturePark.common.dao;


import kg.twojin.culturePark.common.vo.MemberVO;

import java.util.List;

public interface MemberDAO {

    int insertMember(MemberVO memberVO);

    List<MemberVO> selectAllMember();

    String selectEmail(String userEmail);

    String selectNickName(String userNick);

<<<<<<< HEAD
    int updateMemberActive(MemberVO memberVO);

    int updateMemberPassword(int mb_seq ,String mb_pw);




}
=======

}

>>>>>>> 873c732985aa8cbfa86e0c1e1cda867497f0781f
