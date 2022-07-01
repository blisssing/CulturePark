package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.AdminLogDAO;
import kg.twojin.culturePark.common.vo.ProductLogVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminLogDAO")
public class AdminLogDAOImpl implements AdminLogDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int insertLogToPCL(ProductLogVO productLogVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mapper.adminLog.insertLogToPCL", productLogVO);
        } catch (Exception e) {
            System.out.println("로그 기록 오류 발생!!");
            e.printStackTrace();
        }
        return result;
    }
}
