package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.common.vo.*;

import java.util.List;

public interface ManagerProductManageService {

    int createNewProductReqeust(ProductVO productVO);

    List<ProductRequestVO> getAllProductCreateRequestList(int pdr_seq);

    ProductLogVO getProductLogByPdrSeq(int pt_seq);

    AdminVO getAdminInfoBySeq(int ad_seq);
}
