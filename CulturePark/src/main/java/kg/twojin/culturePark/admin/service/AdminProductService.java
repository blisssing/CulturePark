package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.ProductLogVO;
import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminProductService {
    List<ProductVO> getProductRequestList();

    List<Map<String ,Object>> getProductEssentialList();

    int agreeProductCreate(ProductLogVO productLogVO);

    int refuseProductCreate(ProductLogVO productLogVO);

    List<HashMap<String ,Object>> getProductModifyRequestList();

    ProductVO getProductInfo(HashMap hashMap);


    // PI : update
    boolean changeProductStatus(ProductVO productVO, int ad_seq);


}
