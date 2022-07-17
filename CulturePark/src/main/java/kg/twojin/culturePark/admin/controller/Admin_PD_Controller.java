package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.Ad_ManagerAccountService;
import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@RestController
public class Admin_PD_Controller {

    @Autowired
    AdminProductService adminProductService;

    @Autowired
    PartnerService partnerService;

    @Autowired
    Ad_ManagerAccountService ad_managerAccountService;

    @RequestMapping(value = "pdList.ado")
    public ModelAndView pdManageList() {

        

        ModelAndView mv = new ModelAndView();

        List<Map<String, Object>> mapList = adminProductService.getProductEssentialList();

//        for (Map map : mapList) {
//            Iterator it = map.entrySet().iterator();
//            while (it.hasNext()) {
//                Map.Entry entry = (Map.Entry) it.next();
//                System.out.println("entry.getKey() = " + entry.getKey());
//                System.out.println("entry.getValue() = " + entry.getValue());
//            }
//        }

        if (mapList!= null) {
            mv.setViewName("pd_productList");
            mv.addObject("mapList", mapList);
        } else {
            mv.setViewName("accessError");
        }

        return mv;
    }


    @RequestMapping("/changePdStatus.ado")
    public void changePdStatus(HttpServletRequest request, HttpServletResponse response,
                               @RequestBody ProductVO productVO) throws IOException {

        String genre = productVO.getPd_genre1();

        AdminVO adminVO = (AdminVO) request.getSession().getAttribute("admin");
        int ad_seq = adminVO.getAd_seq();

        boolean result;

        result = adminProductService.changeProductStatus(productVO, ad_seq);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", result);

        PrintWriter out = response.getWriter();
        out.print(jsonObject);
    }

    @RequestMapping(value = "pdDetailProc.ado")
    public void pdDetailProc(@RequestBody HashMap<String, Object> hashMap,
                         HttpServletRequest request, HttpServletResponse response) {
//        Iterator it = hashMap.entrySet().iterator();
//        while (it.hasNext()) {
//            Map.Entry<String, Object> entry = (Map.Entry) it.next();
//        }
        ProductVO productVO = adminProductService.getProductInfo(hashMap);
        System.out.println("세션에 넣음 : " + productVO.toString());
        HttpSession session = request.getSession();
        session.setAttribute("productVO", productVO);
    }

    @RequestMapping(value = "pdDetail.ado")
    public ModelAndView pdDetail(HttpServletRequest request) {
        ProductVO productVO = null;
        PartnerVO partnerVO = null;
        ManagerVO managerVO = null;

        productVO = (ProductVO) request.getSession().getAttribute("productVO");

        int pt_seq = productVO.getPt_seq();
        partnerVO = partnerService.getPartnerBySeq(pt_seq);

        managerVO = ad_managerAccountService.getManagerInfoByEmail(partnerVO.getPt_email());

        if (managerVO != null) {
            System.out.println("managerVO = " + managerVO.toString());
        } else {
            System.out.println("3 널");
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_detailPage");
        mv.addObject("manager", managerVO);
        mv.addObject("partner", partnerVO);
        mv.addObject("product", productVO);


        return mv;
    }
}
