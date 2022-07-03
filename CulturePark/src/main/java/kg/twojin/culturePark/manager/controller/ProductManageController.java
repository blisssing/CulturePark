package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ProductionManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductManageController {

    @Autowired
    ProductionManageService exhibitionManageService;

    @Autowired
    ProductionManageService museumManageService;


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


}
