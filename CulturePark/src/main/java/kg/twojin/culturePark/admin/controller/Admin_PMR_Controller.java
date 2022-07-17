package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.AdminPmrService;
import kg.twojin.culturePark.admin.service.AdminProductService;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.controller.FileTestController;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


@RestController
public class Admin_PMR_Controller {

    @Autowired
    AdminProductService adminProductService;

    @Autowired
    AdminPmrService adminPmrService;

    Logger logger = LogManager.getLogger(Admin_PMR_Controller.class);

    @RequestMapping(value = "/pdModifyRequest.ado")
    public ModelAndView pdModifyRequest() {
        List<HashMap<String, Object>> productVOList = adminProductService.getProductModifyRequestList();
        ModelAndView mv = new ModelAndView();
        if (productVOList != null) {
            int listSize = productVOList.size();

            for (HashMap<String, Object> map : productVOList) {
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

    @RequestMapping(value = "/pmrInfo.ado", method = RequestMethod.POST)
    public Map<String, Object> getPmrInfo(@RequestParam("pmr_seq") int pmr_seq) {
        Map<String, Object> map = adminPmrService.getPmrInfo(pmr_seq);

        Iterator it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, Object> entry = (Map.Entry) it.next();
            System.out.println("entry.getKey() = " + entry.getKey());
            System.out.println("entry.getValue() = " + entry.getValue());

        }
        return map;
    }

    @RequestMapping(value = "/refusePmr.ado", method = RequestMethod.POST)
    public void refusePmr(@RequestBody Map <String ,Object> map, HttpServletRequest request) {
        AdminVO adminVO =(AdminVO) request.getSession().getAttribute("adminVO");
        map.put("ad_seq", adminVO.getAd_seq());
        int result =adminPmrService.refusePmr(map);





    }
}
