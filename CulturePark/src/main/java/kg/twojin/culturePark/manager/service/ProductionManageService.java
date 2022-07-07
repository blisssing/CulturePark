package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.List;

public interface ProductionManageService {

    List<ProductVO> getProductList(int pt_seq);

    int changeProductStatus(ProductVO productVO);


}
