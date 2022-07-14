package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.ProductLogVO;
import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.HashMap;
import java.util.List;

public interface AdminProductService {
    List<ProductVO> getProductList();

    int agreeProductCreate(ProductLogVO productLogVO);

    int refuseProductCreate(ProductLogVO productLogVO);

    List<HashMap<String ,Object>> getProductModifyRequestList();
}
