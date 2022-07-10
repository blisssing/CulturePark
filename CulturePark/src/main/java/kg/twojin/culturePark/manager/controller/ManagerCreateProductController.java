package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.common.vo.*;
import kg.twojin.culturePark.manager.service.ManagerProductManageService;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RestController
public class ManagerCreateProductController {

    @Autowired
    ManagerProductManageService managerProductManageService;


    @RequestMapping(value = "requestNewProduct.mdo")
    public int createNewProduct(HttpServletResponse response, HttpServletRequest request,
                                @RequestBody ProductVO productVO) {

        System.out.println("동작확인");
        System.out.println(productVO.toString());

        // 세션에서 매니저의 회사 정보를 얻어와서 product 객체에 옮김

        //HttpSession session = request.getSession();
        //ManagerVO managerVO = (ManagerVO) session.getAttribute("manager");
        //int pt_seq = managerVO.getComp_seq();

        //Todo : pt_seq, pt_request_manager 위의 주석으로 대체할 것

        int pt_seq = 1;
        String pt_request_manager = "taran0913@naver.com";

        productVO.setPt_seq(pt_seq);
        productVO.setPd_request_manager(pt_request_manager);

        int openTime = productVO.getPd_openTime();
        int closeTime = productVO.getPd_closeTime();


        int result = managerProductManageService.createNewProductReqeust(productVO);

        if (result == 1) {
            return result;
        } else {
            // 실패
            return result;
        }
    }


    @RequestMapping(value = "pdCreateRequestList.mdo")
    public ModelAndView getPdCreateRequestList(HttpServletResponse response, HttpServletRequest request) {
        // Todo : 바꿔줄 것

        // ***********

        //ManagerVO managerVO = (ManagerVO) request.getSession().getAttribute("manager");
        //int pt_seq = managerVO.getComp_seq();

        // ------------
        int pt_seq = 1;
        ModelAndView mv = new ModelAndView();
        // ------------

        List<ProductRequestVO> productRequestVOList = null;
        productRequestVOList = managerProductManageService.getAllProductCreateRequestList(pt_seq);

        for (int i = 0; i < productRequestVOList.size(); i++) {
            System.out.println(productRequestVOList.get(i).toString());
        }

        if (productRequestVOList != null) {
            mv.addObject("productRequestList", productRequestVOList);
            mv.setViewName("pd_createRequestList");
        } else {
            mv.setViewName("common_errorPage_manager");
            mv.addObject("errorReason", "fail_action");
        }

        return mv;
    }

    @RequestMapping(value = "/getProductRequestLog.mdo")
    public void getProductRequestLog(@RequestParam int pdr_seq, HttpServletResponse response, HttpServletRequest request)
                                    throws IOException {

        System.out.println(pdr_seq);

        ProductLogVO productLogVO1 = managerProductManageService.getProductLogByPdrSeq(pdr_seq);

        System.out.println(productLogVO1.toString());


        JSONObject json = new JSONObject();
        String resultStr = null;
        if (productLogVO1 != null) {
            resultStr = "success";
            json.put("ad_email", productLogVO1.getAd_email());
            json.put("ad_tel", productLogVO1.getAd_tel());
            json.put("pcl_comments", productLogVO1.getPcl_comments());
        } else {
            resultStr = "failed";
        }


        System.out.println(resultStr);

        json.put("result", resultStr);

        PrintWriter writer = response.getWriter();
        writer.print(json);

    }
}