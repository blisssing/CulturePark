package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.List;
import java.util.Map;

public interface ProductDAO {

    // 상품 요청 정보 생성
    int insertProductRequest(ProductVO productVO);

    // 상품 정보 생성
    int insertNewProduct(int pdr_seq);

    // 상품 요청 리스트 검색
    List selectAllNewProduct();

    // 전시 상품 리스트 검색
    List selectAllExhibitProductByPtSeq(int pt_seq);

    // 뮤지엄 상품 리스트 검색
    List selectAllMuseumProductByPtSeq(int pt_seq);

    List selectAllProductModiRequestList();

    public List selectAllOnwPdCreateRequest(int pt_num);

    int updateProductRequestStatusAgree(int pdr_seq);

    int updateProductRequestStatusRefused(int pdr_seq);

    int updateProductStatus(ProductVO productVO);

    int insertProductModiRequest(ProductVO productVO, int mg_seq);
}
