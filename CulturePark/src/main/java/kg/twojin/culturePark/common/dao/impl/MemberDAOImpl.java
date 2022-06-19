package kg.twojin.culturePark.common.dao.impl;


import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int createMember(MemberVO memberVO) {
        return 0;
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
            System.out.println("조회결과 : 없음");
        }
        return result;
    }
}
