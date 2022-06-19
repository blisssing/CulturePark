package kg.twojin.culturePark.manager.controller;

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
    ManagerManageService managerManageService;


    @RequestMapping(value = "/mAccountList.mdo")
    public ModelAndView mgMAccountList(HttpServletRequest request, HttpServletResponse response) {

        List<ManagerVO> managerVOList;
        ModelAndView mv = new ModelAndView();


        managerVOList = managerManageService.getManagerList();

        if (managerVOList == null) {
            mv.setViewName("redirect:/index.mdo");
        } else {
            mv.addObject("memberList", managerVOList);
            mv.setViewName("m_account_list");
        }

        return mv;
    }

    @RequestMapping(value = "/mAccountAdd.mdo")
    public ModelAndView mgMAccountAdd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("m_account_add");
        return mv;
    }

    @RequestMapping(value = "/mAccountAddProc.mdo")
    public ModelAndView mgMAccountAddProc(@ModelAttribute("managerVO") ManagerVO insertedVO,
                                          @RequestParam List<String> chk_is,
                                          HttpServletResponse response, HttpServletRequest request) {

        System.out.println("AddProc 동작 확인");
        ModelAndView mv = new ModelAndView();
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

        int result = managerManageService.insertManager(insertedVO);

        if (result == 1) {
            mv.setViewName("redirect:/mAccountList.mdo");
        } else {
            mv.setViewName("redirect:/index.mdo");
        }

        return mv;
    }

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


    @RequestMapping("mAccountModify.mdo")
    public ModelAndView mgMAccountModify(@ModelAttribute("managerVO") ManagerVO updateVO,
                                         @RequestParam List<String> chk_is,
                                         HttpServletResponse response, HttpServletRequest request) {

        System.out.println("modify 동작 확인");
        ModelAndView mv = new ModelAndView();
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
        updateVO.setMg_is(chk_str);

        int result = managerManageService.updateManager(updateVO);

        if (result == 1) {
            mv.setViewName("redirect:/mAccountList.mdo");
        } else {
            mv.setViewName("redirect:/index.mdo");
        }

        return mv;
    }


    @RequestMapping("mAccountDelete.mdo")
    public ModelAndView mgAccountDelete(@ModelAttribute("mg_seq") ManagerVO deleteVO,
                                        HttpServletRequest request, HttpServletResponse response) {

        System.out.println("delete 동작 확인");
        ModelAndView mv = new ModelAndView();
       /* String chk_text_check = chk_text;
        String chk_text_ok = "매니저를 삭제합니다";*/


        int result = managerManageService.deleteManager(deleteVO);

        if (result == 1) {
            mv.setViewName("redirect:/mAccountList.mdo");
        } else {
            mv.setViewName("redirect:/index.mdo");
        }

        return mv;

        /*if(chk_text_check == chk_text_ok) {
            result = 1;
        }else {
           result = 0;
        }

        if (result == 1) {
            mv.setViewName("redirect:/mAccountList.mdo");
        } else {
            mv.setViewName("redirect:/index.mdo");
        }

        return mv;*/
    }

}



