package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ManagerAdminService;
import kg.twojin.culturePark.manager.service.ProductionManageService;
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
import java.util.List;

@RestController
public class ProductManageController {

    @Autowired
    ProductionManageService exhibitionManageService;

    @Autowired
    ProductionManageService museumManageService;

    @Autowired
    ManagerAdminService managerAdminService;

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
                                 @RequestBody ProductVO productVO) throws IOException{
        String genre = productVO.getPd_genre1();

        System.out.println(productVO.toString());

        int result;

        if (genre.equals("museum")) {
            result=0;
            System.out.println("뮤지엄입니다");
        } else {
            result = exhibitionManageService.changeProductStatus(productVO);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", result);


        PrintWriter out = response.getWriter();
        out.print(jsonObject);
    }
}
