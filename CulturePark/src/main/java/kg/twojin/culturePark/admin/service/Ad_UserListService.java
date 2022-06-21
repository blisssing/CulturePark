package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.MemberVO;

import java.util.List;

public interface Ad_UserListService {

    List<MemberVO> getMemberList();

    int updateMemberActive(MemberVO memberVO);

    int modifyMemberPassword(int mb_seq, String pw);



}


