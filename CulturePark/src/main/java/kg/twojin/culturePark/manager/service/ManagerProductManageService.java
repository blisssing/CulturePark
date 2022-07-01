package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.ProductRequestVO;
import kg.twojin.culturePark.common.vo.ProductVO;

import java.util.List;

public interface ManagerProductManageService {

    int createNewProductReqeust(ProductVO productVO);

    List<ProductRequestVO> getAllProductCreateRequestList(int pt_num);
}
