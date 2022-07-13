package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProductionManageService {

    List<ProductVO> getProductList(int pt_seq);

    int changeProductStatus(ProductVO productVO);

    int modifyProductSetting(HashMap <String, Object> hashMap);


}
