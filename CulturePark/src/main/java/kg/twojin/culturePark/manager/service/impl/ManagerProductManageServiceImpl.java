package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ManagerProductManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("managerProductManageService")
public class ManagerProductManageServiceImpl implements ManagerProductManageService {

    @Autowired
    ProductDAO productDAO;

    @Override
    public int createNewProductReqeust(ProductVO productVO) {
        return productDAO.insertProductRequest(productVO);
    }


}
