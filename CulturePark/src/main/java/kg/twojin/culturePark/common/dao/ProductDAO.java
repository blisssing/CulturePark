package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.List;

public interface ProductDAO {

    int insertProductRequest(ProductVO productVO);

    int insertNewProduct(int pdr_seq);

    List selectAllNewProduct();

    public List selectAllOnwPdCreateRequest(int pt_num);

    int updateProductRequestStatusAgree(int pdr_seq);

    int updateProductRequestStatusRefused(int pdr_seq);


}
