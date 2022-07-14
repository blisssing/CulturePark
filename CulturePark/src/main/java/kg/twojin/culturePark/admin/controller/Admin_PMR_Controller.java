package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.controller.FileTestController;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


@RestController
public class Admin_PMR_Controller {

    @Autowired
    AdminProductService adminProductService;

    Logger logger = LogManager.getLogger(Admin_PMR_Controller.class);

    @RequestMapping(value = "/pdModifyRequest.ado")
    public ModelAndView pdModifyRequest() {
        List <HashMap<String,Object>>  productVOList =adminProductService.getProductModifyRequestList();
        ModelAndView mv = new ModelAndView();
        if (productVOList != null) {
            int listSize = productVOList.size();

            for (HashMap<String, Object> map : productVOList) {
                logger.info("--------목록 --------");

                Iterator it = map.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry<String, Object> entry = (Map.Entry) it.next();
                    logger.info(entry.getKey() + ":" + entry.getValue());
                }

            }

            mv.setViewName("pd_modiRequest");
            mv.addObject("productList", productVOList);
        } else {
            logger.info("실행 이상!");
            return null;
        }
        return mv;
    }
}
