package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@RestController
public class Admin_PD_Controller {

    @Autowired
    AdminProductService adminProductService;

    @RequestMapping(value = "pdList.ado")
    public ModelAndView pdManageList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pd_progressList");
        return mv;
    }

    @RequestMapping(value = "pdDetail.ado")
    public ModelAndView pdDetail(@RequestBody HashMap <String ,Object> hashMap) {
        ProductVO productVO = adminProductService.getProductInfo(hashMap);
        ModelAndView mv = new ModelAndView();
        if (productVO != null) {
            mv.setViewName("pd_detailPage");
            mv.addObject(productVO);
        } else {
            // Todo 작동 오류 페이지로 바꿔줄 것
            mv.setViewName("accessError");
        }

        return mv;
    }
}
