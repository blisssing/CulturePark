package kg.twojin.culturePark.dao.admin;

import kg.twojin.culturePark.vo.admin.AdminVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAO {

    @Autowired
    private AdminVO adminVO;

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private AdminVO loginAdmin(AdminVO adminVO) {
        AdminVO vo = sqlSessionTemplate.selectOne("selectAdmin", adminVO);
        return vo;
    }



}
