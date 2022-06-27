package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int insertProduct(ProductVO productVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mapper.product.insertProduct");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
