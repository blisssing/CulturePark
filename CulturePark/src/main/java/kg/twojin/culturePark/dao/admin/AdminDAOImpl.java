package kg.twojin.culturePark.dao.admin;

import kg.twojin.culturePark.vo.admin.AdminVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{

    @Autowired
    private AdminVO adminVO;

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public AdminVO loginAdmin(AdminVO adminVO) {
        AdminVO vo = sqlSessionTemplate.selectOne("mapper.admin.selectAdmin", adminVO);
        return vo;
    }

    @Override
    public int createAdmin(AdminVO adminVO) {
        int result = sqlSessionTemplate.insert("mapper.admin.createAdmin", adminVO);
        return result;
    }
}
