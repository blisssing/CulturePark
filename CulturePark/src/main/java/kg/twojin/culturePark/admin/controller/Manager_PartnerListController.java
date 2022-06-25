package kg.twojin.culturePark.admin.controller;



import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
public class Manager_PartnerListController {

    @Autowired
    PartnerService partnerService;

    @RequestMapping(value = "/mgPartnerList.ado")
    public ModelAndView partnerListPage(HttpServletRequest request, HttpServletResponse response
    ) {

        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView();

//        try {
        System.out.println("실행확인");
//            AdminVO admin = (AdminVO) session.getAttribute("admin");
        List<PartnerVO> partner = partnerService.getAllPartner();
        mv.addObject("partnerList", partner);
        mv.setViewName("mg_partnerList");
        for (PartnerVO var : partner) {
            System.out.println(var.toString());
        }
//        } catch (NullPointerException e) {
//            mv.setViewName("accessError");
//        }


        return mv;
    }

    // Todo : 매니저 목록 조회, 상품 목록 조회




}
