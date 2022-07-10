package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ProductionManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("museumManageService")
public class MuseumManageService implements ProductionManageService {

    @Autowired
    ProductDAO productDAO;

    @Override
    public List<ProductVO> getProductList(int pt_seq) {
        return productDAO.selectAllMuseumProductByPtSeq(pt_seq);
    }


    @Override
    public int changeProductStatus(ProductVO productVO) {
        return 0;
    }
}
