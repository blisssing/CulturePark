package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.AdminDAO;
import kg.twojin.culturePark.common.vo.AdminVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public AdminVO loginAdmin(AdminVO adminVO) {  // (AdminVO의 변수이름 adminVO)
        AdminVO vo = null; //오류일경우 null을 담는다
        try {
            vo = sqlSessionTemplate.selectOne("mapper.admin.selectAdmin", adminVO);
        } catch (Exception e) { // admin-mapper.xml안에 selectAdmin의 아이디를 가진 쿼리문을 담는 변수에
            //adminVO의 반환값으로 반환한다.
            e.printStackTrace(); //회원이 없을경우 vo에 null이 그대로 유지된다.
        }
        return vo;
    }

    // 계정생성
    @Override
    public int insertAdmin(AdminVO adminVO) {
        return sqlSessionTemplate.insert("mapper.admin.insertAdmin", adminVO);
    }

    //계정 수정 1 : 비밀번호 변경 포함

    @Override
    public int updateAdminWithPw(AdminVO adminVO) {
        int result=0;
        try {
            result = sqlSessionTemplate.update("mapper.admin.updateAdminWithPw", adminVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    //계정 수정 2 : 비밀번호 미변경
    @Override
    public int updateAdminWithoutPw(AdminVO adminVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.admin.updateAdminWithoutPw", adminVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 계정삭제
    @Override
    public int removeAdmin(AdminVO adminVO) {
        int result = 0;
        try {

            result = sqlSessionTemplate.delete("mapper.admin.deleteAdmin", adminVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public AdminVO selectAdminInfo(int seq) {
        AdminVO adminVO = null;
        try {
            adminVO = sqlSessionTemplate.selectOne("mapper.admin.selectAdminInfo", seq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adminVO;
    }

    @Override
    public List listAdmins() {
        List<AdminVO> adminList = null;
        adminList = sqlSessionTemplate.selectList("mapper.admin.selectAllAdmin");
        return adminList;
    }
}
