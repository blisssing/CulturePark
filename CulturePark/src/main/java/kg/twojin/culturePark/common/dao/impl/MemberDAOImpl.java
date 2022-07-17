package kg.twojin.culturePark.common.dao.impl;


import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.common.vo.PauseVO;
import org.apache.maven.shared.invoker.SystemOutHandler;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Member;
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
    public int joinUpdateMember(MemberVO memberVO) {
        int result;
        try{
            result = sqlSessionTemplate.update("mapper.user.joinUpdateMember",memberVO);
        }catch(Exception e){
            e.printStackTrace();
            result = 0;
        }
        return result;
    }


    @Override
    public int updateMemberWithoutPw(MemberVO memberVO) {
        int result;
        try{
            result = sqlSessionTemplate.update("mapper.user.updateMemberWithoutPw", memberVO);
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
            e.printStackTrace();
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
            e.printStackTrace();
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
    public int updateMemberPasswordUsingEmail(String  mb_email, String mb_pw) {
        MemberVO memberVO = new MemberVO();
        memberVO.setMb_email(mb_email);
        memberVO.setMb_pw(mb_pw);
        int result = 0;

        try {
            result = sqlSessionTemplate.update("mapper.user.updateMemberPassword", memberVO);
            result = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Transactional
    @Override
    public int updateMemberPausePeriod(MemberVO memberVO, PauseVO pauseVO) {

        int result1 = 0;
        int result2 = 0;
        try {
            result1 = sqlSessionTemplate.update("mapper.user.updateMemberPause", memberVO);
            result2 = sqlSessionTemplate.insert("mapper.pause.insertPause", pauseVO);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (result1 == 1 && result2 == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public MemberVO selectMember(MemberVO memberVO) {
        MemberVO vo = null;
        try {
            vo = sqlSessionTemplate.selectOne("mapper.user.selectMember", memberVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

    @Override
    public MemberVO findId(MemberVO memberVO) {
        MemberVO vo = null;
        try{
            vo = sqlSessionTemplate.selectOne("mapper.user.findId", memberVO);
        }catch (Exception e){
            e.printStackTrace();
        }
        return vo;
    }

    @Override
    public MemberVO findPw_Email(MemberVO memberVO) {
        MemberVO vo = null;
        try{
            vo = sqlSessionTemplate.selectOne("mapper.user.findPw_Email", memberVO);
        }catch(Exception e){
            e.printStackTrace();
        }
        return vo;
    }

    @Override
    public MemberVO findPw_Tel(MemberVO memberVO) {
        MemberVO vo = null;
        try{
            vo = sqlSessionTemplate.selectOne("mapper.user.findPw_Tel", memberVO);
        }catch(Exception e){
            e.printStackTrace();
        }
        return vo;
    }

    @Override
    public MemberVO selectExistTel_kakao(MemberVO memberVO) {
        MemberVO vo = null;
        try{
            vo = sqlSessionTemplate.selectOne("mapper.user.selectExistTel_kakao", memberVO);
        }catch(Exception e){
            e.printStackTrace();
        }
        return vo;
    }

}

