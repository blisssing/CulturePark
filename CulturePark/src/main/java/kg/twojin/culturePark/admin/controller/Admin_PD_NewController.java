package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.common.vo.ProductLogVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.apache.xerces.impl.dv.xs.AnyURIDV;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RestController
public class Admin_PD_NewController {

    @Autowired
    AdminProductService adminProductService;

    @Autowired
    PartnerService partnerService;


    @RequestMapping(value = "/pdNewList.ado")
    public ModelAndView newPDList(HttpServletResponse response, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();

        List<ProductVO> productVOList = null;
        List<PartnerVO> partnerVOList = new ArrayList<PartnerVO>();

        productVOList = adminProductService.getProductList();

        for (ProductVO vo : productVOList) {
            int pt_seq = vo.getPt_seq();
            PartnerVO partnerVO = partnerService.getPartnerBySeq(pt_seq);
            partnerVOList.add(partnerVO);
        }

        mv.setViewName("pd_newList");

        mv.addObject("productList", productVOList);
        mv.addObject("partnerList", partnerVOList);

        return mv;
    }

    @RequestMapping(value = "/agreeCreateProduct.ado")
    public String agreePDCreate(@RequestBody ProductLogVO productLogVO,
                                HttpServletRequest request, HttpServletResponse response) {

        AdminVO adminVO = (AdminVO) request.getSession().getAttribute("admin");
        int ad_seq = adminVO.getAd_seq();

        productLogVO.setAd_seq(ad_seq);


        int result = adminProductService.agreeProductCreate(productLogVO);

        String resultStr = null;
        if (result != 1) {
            resultStr = "failed";
        } else {
            resultStr = "success";
        }
        return resultStr;
    }

    @RequestMapping(value = "/refuseCreateProduct.ado")
    public String refusePDCreate(@RequestBody ProductLogVO productLogVO, HttpServletRequest request,
                                 HttpServletResponse response) {

//        AdminVO adminVO = (AdminVO) request.getSession().getAttribute("admin");
//        int ad_seq = adminVO.getAd_seq();
        int ad_seq = 1;

        productLogVO.setAd_seq(ad_seq);

        int result = adminProductService.refuseProductCreate(productLogVO);

        System.out.println("dao 실행 결과 : " + result);

        String resultStr = null;
        if (result != 1) {
            resultStr = "failed";
        } else {
            resultStr = "success";
        }
        return resultStr;
    }
}
