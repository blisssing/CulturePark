package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ProductionManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("exhibitionManageService")
public class ExhibitionManageService implements ProductionManageService {

    @Autowired
    ProductDAO productDAO;

    @Override
    public List<ProductVO> getProductList(int pt_seq) {
        return productDAO.selectAllExhibitProductByPtSeq(pt_seq);
    }

    @Override
    @Transactional
    public int changeProductStatus(ProductVO productVO) {
        return productDAO.updateProductStatus(productVO);
    }

    @Override
    public int modifyProductSetting(HashMap<String, Object> hashMap) {
        int modifyResult = productDAO.updateProductSetting(hashMap);
        if (modifyResult == 1) {

        } else {
            return 0;
        }


        return 1;
    }
}
