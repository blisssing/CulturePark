package kg.twojin.culturePark.manager.controller;

import com.google.gson.JsonParser;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
public class ManagerProductController {

    @RequestMapping(value = "requestNewProduct.mdo")
    public void createNewProduct(HttpServletResponse response, HttpServletRequest request,
                                 @RequestBody ProductVO productVO)  {

        System.out.println("동작확인");

        System.out.println(productVO.toString());

        // Todo : jsp에 시작날짜 , 종료날짜 만들어주는 칸 기입해줄 것


    }
}
