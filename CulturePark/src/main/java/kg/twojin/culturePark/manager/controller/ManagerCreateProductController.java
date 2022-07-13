package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.common.service.FileUploaderService;
import kg.twojin.culturePark.common.vo.*;
import kg.twojin.culturePark.manager.service.ManagerProductManageService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@RestController
public class ManagerCreateProductController {

    @Autowired
    ManagerProductManageService managerProductManageService;

    @Autowired
    FileUploaderService fileUploaderService;

    // Todo : 업로드 양식으로 바꿔주는 중
    @RequestMapping(value = "requestNewProduct.mdo")
    public int createNewProduct(HttpServletResponse response, HttpServletRequest request,
                                @RequestPart("key") ProductVO productVO,
                                @RequestPart("thumbNail") MultipartFile thumb_file,
                                @RequestPart("descript") MultipartFile descript_file,
                                @RequestPart("mainImg") MultipartFile main_file) {

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

        // 파일 업로드

        HashMap<String, MultipartFile> multipartFileHashMap = new HashMap<>();

        // 해시맵에 각 파일 데이터를 담아줌
        multipartFileHashMap.put("thumbNail", thumb_file);
        multipartFileHashMap.put("descript", descript_file);
        multipartFileHashMap.put("mainImg", main_file);


        HashMap<String, String> resultUpload = null;

        try {
            // 업로드 결과로 키와 경로값이 담겨 있는 해시맵을 받아옴.
            resultUpload = managerProductManageService.uploadEssentialFiles(multipartFileHashMap);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int result = 0;

        if (resultUpload != null) {

            // 경로값이 담겨져 있는 해시맵을 통해 경로를 vo에 넣어줌
            productVO.setPd_thumbnail_PATH(resultUpload.get("thumb"));
            productVO.setPd_descript_PATH(resultUpload.get("descript"));
            productVO.setPd_mainImg_PATH(resultUpload.get("mainImg"));

            System.out.println(productVO.toString());

            // 최종적으로 셋팅이 완료됀 vo를 db에 주입
            result = managerProductManageService.createNewProductRequest(productVO);
        } else{
            return result;
        }

        return result;
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
