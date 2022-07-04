package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.common.dao.ManagerDAO;
import kg.twojin.culturePark.manager.service.ManagerManageService;
import kg.twojin.culturePark.common.vo.ManagerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class Mg_accountController {

    @Autowired
    ManagerDAO managerDAO;

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

        // 회사정보 뽑아오기

        HttpSession session = request.getSession();
        ManagerVO managerVO = (ManagerVO) session.getAttribute("manager");
        int pt_seq = managerVO.getComp_seq();

        insertedVO.setComp_seq(pt_seq);

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


    @RequestMapping("mAccountModifyProc.mdo")
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

// 삭제 1 번 형식 : 기본 형식
    /*@RequestMapping("mAccountDeleteProc.mdo")
    public ModelAndView mgAccountDelete(HttpServletRequest request, HttpServletResponse response,
                                        @ModelAttribute("managerVO") ManagerVO deleteVO) {

        ModelAndView mv = new ModelAndView();

        System.out.println("delete 동작 확인");
        int result = managerManageService.deleteManager(deleteVO);

        if (result == 1) {
            System.out.println("삭제 성공");
            mv.setViewName("redirect:/mAccountList.mdo");
        } else {
            System.out.println("삭제 실패");
            mv.setViewName("redirect:/index.mdo");
        }
        return mv;

    }*/

// 삭제 2 번 형식 : Ajax 형식
    @RequestMapping("/mAccountDeleteProc.mdo")
    @ResponseBody
    public String mgAccountDelete(HttpServletRequest request, HttpServletResponse response,
                                        @RequestParam("mg_seq") String mg_seq) {

        ModelAndView mv = new ModelAndView();

        int int_seq = Integer.parseInt(mg_seq);

        System.out.println("delete 동작 확인");
        int result = managerManageService.deleteManager(int_seq);

        String result_str = "";
        if (result == 1) {
            System.out.println("삭제 성공");
            result_str = "success";
        } else {
            System.out.println("삭제 실패");
            result_str = "failed";
        }
        return result_str;

    }

}



