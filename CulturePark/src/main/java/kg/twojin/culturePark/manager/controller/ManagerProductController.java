package kg.twojin.culturePark.manager.controller;

import com.google.gson.JsonParser;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ManagerProductManageService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class ManagerProductController {

    @Autowired
    ManagerProductManageService managerProductManageService;

    @RequestMapping(value = "requestNewProduct.mdo")
    public int createNewProduct(HttpServletResponse response, HttpServletRequest request,
                                 @RequestBody ProductVO productVO)  {

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
}
