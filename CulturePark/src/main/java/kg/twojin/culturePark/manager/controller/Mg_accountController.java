package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.manager.dao.ManagerDAO;
import kg.twojin.culturePark.manager.service.ManagerManageService;
import kg.twojin.culturePark.manager.vo.ManagerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
public class Mg_accountController {

    @Autowired
    ManagerDAO managerDAO;

    @Autowired
    ManagerManageService managerManageService;



    @RequestMapping(value = "/mAccountList.mdo")
    public ModelAndView mgMAccountList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("m_account_list");
        return mv;
    }

    @RequestMapping(value = "/mAccountAdd.mdo")
    public ModelAndView mgMAccountAdd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("m_account_add");
        return mv;
    }

    @RequestMapping(value="/mAccountAddProc.mdo")
    public ModelAndView mgMAccountAddProc(

        /*ManagerVO 자료형의 변수들과 input의 name(key값)이 같을 경우 insertedVO에 값을 실어서 이 메서드 안에서 사용
        ("managerVO")란 이름으로 만들어줌
        <하위버전>
            @RequestParam String mg_name,
            @RequestParam String mg_email,
            @RequestParam String mg_tel,
            Manager insertedVO  = new Manager();
            insertedVO.set~~~~
            insertedVO.set~~~

        원래는 하나하나 값을 셋팅해줘야 함. 근데 ModelAttribute 어노테이션으로 편하게 해줄 수 있음
        */
        @ModelAttribute("managerVO") ManagerVO insertedVO,
        @RequestParam List<String> chk_is,
        HttpServletResponse response, HttpServletRequest request) {



        int chk_len = chk_is.size();
        String chk_str = "";

        for (int i = 0; i < chk_len; i++) {

            if (i > 0) {
                chk_str += "/" + chk_is.get(i);
            } else {
                chk_str += chk_is.get(i);
            }
        }
        // 권한 문자열 셋팅
        insertedVO.setMg_is(chk_str);

        // 오늘 날짜 셋팅
        Date date = new Date();
        insertedVO.setMg_createDate(date);

        managerManageService.insertManager(insertedVO);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/mAccountList.mdo");
        return mv;
    }


}
