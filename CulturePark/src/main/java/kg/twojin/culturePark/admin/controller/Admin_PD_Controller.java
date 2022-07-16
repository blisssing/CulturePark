package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.Ad_ManagerAccountService;
import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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
        mv.setViewName("pd_progressList");
        return mv;
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
