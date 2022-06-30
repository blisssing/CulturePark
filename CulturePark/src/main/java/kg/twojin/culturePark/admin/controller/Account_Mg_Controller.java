package kg.twojin.culturePark.admin.controller;


import kg.twojin.culturePark.common.vo.ManagerVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Account_Mg_Controller {



    @RequestMapping(value = "mgRequest.ado")
    public ModelAndView mgRequestList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("mg_requestList");
        return mv;
    }

    @RequestMapping(value = "getManagerInfo.ado")
    private void getManagerInfo(@RequestBody ManagerVO managerVO) {

    }
}
