package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProductDAO {

    // PR

        // 상품 요청 리스트 검색
        List selectAllNewProduct();

        public List selectAllOnwPdCreateRequest(int pt_num);

        // 상품 요청 정보 생성
        int insertProductRequest(ProductVO productVO);

        // 승낙
        int updateProductRequestStatusAgree(int pdr_seq);

        // 거절
        int updateProductRequestStatusRefused(int pdr_seq);




    // PI

        // Insert
            int insertNewProduct(int pdr_seq);

        //Select


            // 전시 상품 리스트 검색
            List selectAllExhibitProductByPtSeq(int pt_seq);

            // 뮤지엄 상품 리스트 검색
            List selectAllMuseumProductByPtSeq(int pt_seq);

            // 상품 정보 검색
            ProductVO selectProductInfo(HashMap hashMap);

            List selectAllProductEssential();




    // PMR



    int insertProductModiRequest(ProductVO productVO, int mg_seq);

    int updatePmrStatus(Map<String, Object> map);

    // 변경 요청 검색
    Map<String, Object> selectPmrInfo(int pmr_seq);


    List selectAllProductModiRequestList();





    int updateProductStatus(ProductVO productVO);


}
