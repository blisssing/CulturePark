package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ManagerAdminService;
import kg.twojin.culturePark.manager.service.ProductionManageService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@RestController
public class ProductManageController {

    @Autowired
    ProductionManageService exhibitionManageService;

    @Autowired
    ProductionManageService museumManageService;

    @Autowired
    ManagerAdminService managerAdminService;

    Logger logger = LogManager.getLogger(ProductManageController.class);
    // 전시

    @RequestMapping(value = "/productList.mdo")
    public ModelAndView getProductListPage(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        // Todo : 나중에 전환해줄 것.
        //ManagerVO managerVO = (ManagerVO) session.getAttribute("manager");
        //int pt_seq = managerVO.getPt_seq();

        int pt_seq = 1;

        String pdClass = (String) request.getParameter("class");
        List<ProductVO> productVOList = null;

        ModelAndView mv = new ModelAndView();

        if (pdClass.equals("museum")) {
            productVOList = museumManageService.getProductList(pt_seq);
            mv.setViewName("pd_mu");
            mv.addObject("productList", productVOList);
        } else {
            mv.setViewName("pd_ex");
            productVOList = exhibitionManageService.getProductList(pt_seq);
            mv.addObject("productList", productVOList);
        }
        return mv;
    }


    @RequestMapping(value = "/getAdminInfo.mdo")
    public void mgAdminInfo(HttpServletRequest request, HttpServletResponse response,
                            @RequestParam int pd_seq) throws IOException {

        List<AdminVO> adminVOList = managerAdminService.getAdminListByPdSeq(pd_seq);

        if (adminVOList == null) {
            System.out.println("수행 문제 있음");
        }

        for (AdminVO adminVO : adminVOList) {
            System.out.println(adminVO.toString());
        }

        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();

        session.setAttribute("adminList", adminVOList);

    }


    @RequestMapping(value = "openAdminInfoPop.mdo")
    public ModelAndView openAdminInfoPop() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_adminInfo_pop");
        return mv;
    }

    @RequestMapping("/changePdStatus.mdo")
    public void changePdStatus(HttpServletRequest request, HttpServletResponse response,
                               @RequestBody ProductVO productVO) throws IOException {
        String genre = productVO.getPd_genre1();

        System.out.println(productVO.toString());

        int result;

        if (genre.equals("museum")) {
            result = 0;
            System.out.println("뮤지엄입니다");
        } else {
            result = exhibitionManageService.changeProductStatus(productVO);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", result);


        PrintWriter out = response.getWriter();
        out.print(jsonObject);
    }

    @RequestMapping("/modifyPdInfo.mdo")
    //Todo : 로그에 남겨주기 작성해줄 것
    public int modifyPdInfo(@RequestBody  ProductVO productVO, HttpServletResponse response, HttpServletRequest request) {

        int result = 0;

        //Todo : 바꿔줄 것.
//        HttpSession session = request.getSession();
//        ManagerVO managerVO = (ManagerVO) session.getAttribute("manager");
//        int mg_seq = managerVO.getMg_seq();

        int mg_seq = 1;
        logger.info("productVO : " + productVO.toString());
        logger.info("mg_seq :" + mg_seq);


        if (productVO.getPd_genre1().equals("exhibition")) {
            result = exhibitionManageService.modifyProductSetting(productVO, mg_seq);
        } else {
            result = museumManageService.modifyProductSetting(productVO, mg_seq);
        }

        //        Iterator it = productVO.entrySet().iterator();
//        while (it.hasNext()) {
//            Map.Entry<String, Object> entry = (Map.Entry) it.next();
//            logger.info("키 : " + entry.getKey());
//            logger.info("벨류 : " + entry.getValue());
//        }


        return result;
    }
}
