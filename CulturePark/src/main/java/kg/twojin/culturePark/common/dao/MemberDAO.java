package kg.twojin.culturePark.common.dao;


import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.common.vo.PauseVO;

import java.util.List;

public interface MemberDAO {

    int insertMember(MemberVO memberVO);

    int joinUpdateMember(MemberVO memberVO);



    int updateMemberWithoutPw(MemberVO memberVO);

    List<MemberVO> selectAllMember();

    String selectEmail(String userEmail);

    String selectNickName(String userNick);

    int updateMemberActive(MemberVO memberVO);

    int updateMemberPasswordUsingEmail(String mb_email ,String mb_pw);

    int updateMemberPausePeriod(MemberVO memberVO , PauseVO pauseVO);

    MemberVO selectMember(MemberVO memberVO);

    MemberVO findId(MemberVO memberVO);

    MemberVO findPw_Email(MemberVO memberVO);

    MemberVO findPw_Tel(MemberVO memberVO);

    MemberVO selectExistTel_kakao(MemberVO memberVO);

}


