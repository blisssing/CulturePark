package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.ProductCreateLogDAO;
import kg.twojin.culturePark.common.vo.ProductLogVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productCreateLogDAO")
public class productCreateLogDAOImpl implements ProductCreateLogDAO {

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
            throw e;
        }
        return result;
    }

    @Override
    public ProductLogVO selectProductLogByPdrSeq(int pdr_seq) {
        ProductLogVO productLogVO = null;
        try {
            productLogVO = sqlSessionTemplate.selectOne("mapper.adminLog.selectProductLogByPdrSeq", pdr_seq);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return productLogVO;
    }
}
