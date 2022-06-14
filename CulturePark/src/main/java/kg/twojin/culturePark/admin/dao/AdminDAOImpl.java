package kg.twojin.culturePark.admin.dao;

import kg.twojin.culturePark.admin.vo.AdminVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public AdminVO loginAdmin(AdminVO adminVO) {
        AdminVO vo = sqlSessionTemplate.selectOne("mapper.admin.selectAdmin", adminVO);
        return vo;
    }

    @Override
    public int insertAdmin(AdminVO adminVO) {
        return sqlSessionTemplate.insert("mapper.admin.insertAdmin", adminVO);
    }

    @Override
    public List listAdmins() {
        List<AdminVO> adminList = null;
        adminList = sqlSessionTemplate.selectList("mapper.admin.selectAllAdmin");
        return adminList;
    }
}
