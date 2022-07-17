package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.common.dao.AdPdRelationDAO;
import kg.twojin.culturePark.common.dao.ProductCreateLogDAO;
import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.ProductLogVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    ProductCreateLogDAO productCreateLogDAO;

    @Autowired
    AdPdRelationDAO adPdRelationDAO;

    // Product Request

    @Override
    public List<ProductVO> getProductRequestList() {
        return productDAO.selectAllNewProduct();
    }

    @Override
    @Transactional
    public int agreeProductCreate(ProductLogVO productLogVO) {
        int pdr_seq = productLogVO.getPdr_seq();
        int resultInsertToDB = 0;
        int resultWriteLogToDB = 0;
        int finalResult= 0;

        resultInsertToDB = productDAO.insertNewProduct(pdr_seq);

        if (resultInsertToDB == 1) {
            resultWriteLogToDB = productCreateLogDAO.insertLogToPCL(productLogVO);
        } else {
            System.out.println("오류지점 1 ");
        }

        if (resultWriteLogToDB == 1) {
            finalResult = productDAO.updateProductRequestStatusAgree(pdr_seq);
        } else {
            System.out.println("오류지점 2 ");
        }




        return finalResult;
    }

    @Transactional
    @Override
    public int refuseProductCreate(ProductLogVO productLogVO) {

        int pdr_seq = productLogVO.getPdr_seq();

        System.out.println(productLogVO.toString());
        System.out.println(pdr_seq);
        // 거절 상태를 입력함
        int resultChangeStatus = 0;
        resultChangeStatus = productDAO.updateProductRequestStatusRefused(pdr_seq);
        System.out.println("1: " + resultChangeStatus);


        // 로그에 남김
        int finalChk = 0;

        if (resultChangeStatus == 1) {
            finalChk = productCreateLogDAO.insertLogToPCL(productLogVO);
        }

        System.out.println("2: "+ finalChk);

        return finalChk;
    }



    // Product Info


    @Override
    public List<Map<String, Object>> getProductEssentialList() {
        return productDAO.selectAllProductEssential();
    }

    @Override
    public ProductVO getProductInfo(HashMap hashMap) {
        return productDAO.selectProductInfo(hashMap);
    }

    @Override
    @Transactional
    public boolean changeProductStatus(ProductVO productVO, int ad_seq) {

        int result1 = 0;
        int result2 = 0;

        Map<String, Object> logMap = new HashMap<>();

        logMap.put("pt_seq", productVO.getPt_seq());
        logMap.put("pd_seq", productVO.getPd_seq());
        logMap.put("ad_seq", ad_seq);
        logMap.put("pd_status", productVO.getPd_seq());

        try {
            result1 = productDAO.updateProductStatus(productVO);
            result2 = adPdRelationDAO.insertStatusLog(logMap);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (result1 == 1 && result2 == 1) {
            return true;
        } else {
            return false;
        }
    }


    // Product Modi Request


    @Override
    public List<HashMap<String,Object>> getProductModifyRequestList() {
        return productDAO.selectAllProductModiRequestList();
    }




}
