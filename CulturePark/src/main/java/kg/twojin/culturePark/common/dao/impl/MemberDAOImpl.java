package kg.twojin.culturePark.common.dao.impl;


import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int insertMember(MemberVO memberVO) {
        int result;
        try {
            result = sqlSessionTemplate.insert("mapper.user.insertMember", memberVO);
        } catch (Exception e) {
            e.printStackTrace();
            result = 0;
        }
        return result;
    }

    @Override
    public List<MemberVO> selectAllMember() {
        List<MemberVO> memberVOList = null;
        try {
            memberVOList = sqlSessionTemplate.selectList("mapper.user.selectAllMember");
            System.out.println("실행확인");
        } catch (Exception e) {
            memberVOList = null;
        }

        return memberVOList;
    }

    @Override

    public String selectEmail(String userEmail) {
        String result = null;
        try {
            result = sqlSessionTemplate.selectOne("mapper.user.selectExistEmail", userEmail);
        } catch (Exception e) {

        }
        return result;
    }

    @Override
    public String selectNickName(String userNick) {
        String result = null;
        try {
            result = sqlSessionTemplate.selectOne("mapper.user.selectNickName", userNick);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("조회결과 : 없음");
        }
        return result;
    }

    @Override
    public int updateMemberActive(MemberVO memberVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.user.updateMemberActive", memberVO);
        } catch (Exception e) {
            e.printStackTrace();
            result = -1;
        }
        return result;
    }

    @Override
    public int updateMemberPassword(int mb_seq, String mb_pw) {
        MemberVO memberVO = new MemberVO();
        memberVO.setMb_seq(mb_seq);
        memberVO.setMb_pw(mb_pw);

        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.user.updateMemberPassword", memberVO);
        } catch (Exception e) {
            e.printStackTrace();
            result = 1;
        }

        return result;
    }
}