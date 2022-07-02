package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.AdminDAO;
import kg.twojin.culturePark.common.dao.ProductCreateLogDAO;
import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.ProductLogVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ManagerProductManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("managerProductManageService")
public class ManagerProductManageServiceImpl implements ManagerProductManageService {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    ProductCreateLogDAO productCreateLogDAO;

    @Autowired
    AdminDAO adminDAO;

    @Override
    public int createNewProductReqeust(ProductVO productVO) {
        return productDAO.insertProductRequest(productVO);
    }

    @Override
    public List getAllProductCreateRequestList(int pt_num) {
        return productDAO.selectAllOnwPdCreateRequest(pt_num);
    }

    @Override
    public ProductLogVO getProductLogByPdrSeq(int pdr_seq) {
        ProductLogVO productLogVO =productCreateLogDAO.selectProductLogByPdrSeq(pdr_seq);
        int ad_seq = productLogVO.getAd_seq();

        AdminVO adminVO = adminDAO.selectAdminEmailTel(ad_seq);
        productLogVO.setAd_email(adminVO.getAd_email());
        productLogVO.setAd_tel(adminVO.getAd_tel());

        return productLogVO;
    }

    @Override
    public AdminVO getAdminInfoBySeq(int ad_seq) {
        return adminDAO.selectAdminEmailTel(ad_seq);
    }
}
