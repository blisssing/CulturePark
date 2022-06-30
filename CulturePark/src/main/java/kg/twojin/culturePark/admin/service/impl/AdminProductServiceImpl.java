package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.common.dao.AdminLogDAO;
import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.ProductLogVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    AdminLogDAO adminLogDAO;


    @Override
    public List<ProductVO> getProductList() {
        return productDAO.selectAllNewProduct();
    }

    @Override
    @Transactional
    public int agreeProductCreate(ProductLogVO productLogVO) {
        int pdr_seq = productLogVO.getPdr_seq();
        int resultInsertToDB = productDAO.insertNewProduct(pdr_seq);
        int resultWriteLogToDB = 0;
        int updateRequestStatus = 0;
        int finalResult= 0;

        if (resultInsertToDB == 1) {
            resultWriteLogToDB = adminLogDAO.insertLogToPCL(productLogVO);
        } else {
            System.out.println("오류지점 1 ");
        }

        if (resultInsertToDB == 1) {
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

        // 거절 상태를 입력함
        int resultChangeStatus = 0;
        resultChangeStatus = productDAO.updateProductRequestStatusRefused(pdr_seq);


        // 로그에 남김
        int finalChk = 0;

        if (resultChangeStatus == 1) {
            finalChk = adminLogDAO.insertLogToPCL(productLogVO);
        }

        return finalChk;
    }
}
