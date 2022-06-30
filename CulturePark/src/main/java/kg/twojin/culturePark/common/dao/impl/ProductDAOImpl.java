package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.ProductRequestVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List selectAllNewProduct() {
        List<ProductVO> productVOList = null;
        try {
            productVOList = sqlSessionTemplate.selectList("mapper.productRequest.selectAllNewProduct");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productVOList;
    }

    @Override
    public int insertProductRequest(ProductVO productVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mapper.productRequest.insertProduct", productVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    @Override
    public int insertNewProduct(int pdr_seq) {

        ProductRequestVO productRequestVO = new ProductRequestVO();

        int result1 = 0;

        // 1단계 : pdr 정보를 통해 요청 정보 전체를 productVO에 담기
        try {
            productRequestVO = sqlSessionTemplate.selectOne("mapper.productRequest.selectProductRequestBySeq", pdr_seq);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 2단계 : 모든 정보가 담겨져 있는 productVO를 ProductInfo 테이블에 담아주기 < == 허용된 상품만 등록됨
        if (productRequestVO != null) {
            try {
                result1 = sqlSessionTemplate.insert("mapper.productInfo.insertProduct", productRequestVO);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            return -1;
        }

        if (result1 == 1 && productRequestVO != null) {
            System.out.println("dao 정상 수행함!!");
            return 1;
        } else {
            return -1;
        }

    }

    @Override
    public int updateProductRequestStatusAgree(int pdr_seq) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.productRequest.updateRequestStatusAgree", pdr_seq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int updateProductRequestStatusRefused(int pdr_seq) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.productRequest.updateRequestStatusRefused");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
