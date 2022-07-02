package kg.twojin.culturePark.admin.controller;


import com.google.gson.JsonObject;
import kg.twojin.culturePark.admin.service.Ad_ManagerInfoService;
import kg.twojin.culturePark.common.vo.ManagerVO;
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

@RestController
public class Account_Mg_Controller {

    @Autowired
    Ad_ManagerInfoService ad_managerInfoService;


    @RequestMapping(value = "mgRequest.ado")
    public ModelAndView mgRequestList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("mg_requestList");
        return mv;
    }

    @RequestMapping(value = "/getManagerInfo.ado")
    private void getManagerInfo(@RequestBody ManagerVO managerVO,
                                HttpServletResponse response, HttpServletRequest request)
                                        throws IOException {
        ManagerVO vo = null;

        vo = ad_managerInfoService.getManagerInfoByEmailAndPt(managerVO);

        JSONObject json = new JSONObject();
        String result_str = "";

        if (vo != null) {
            json.put("manager", vo);
            result_str = "success";
        } else {
            result_str = "failed";
        }

        PrintWriter printWriter = response.getWriter();
        printWriter.print(json);
    }
}
