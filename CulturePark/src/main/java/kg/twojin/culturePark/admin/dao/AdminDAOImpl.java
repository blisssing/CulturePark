package kg.twojin.culturePark.admin.dao;

import kg.twojin.culturePark.admin.vo.AdminVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{

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

    @Override
    public int insertAdmin(AdminVO adminVO) {
        return sqlSessionTemplate.insert("mapper.admin.insertAdmin", adminVO);
    }


    @Override
    public int removeAdmin(AdminVO adminVO) {


        return 0;
    }

    @Override
    public List listAdmins() {
        List<AdminVO> adminList = null;
        adminList = sqlSessionTemplate.selectList("mapper.admin.selectAllAdmin");
        return adminList;
    }
}
