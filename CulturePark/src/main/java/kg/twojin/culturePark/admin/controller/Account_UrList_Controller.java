package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.Ad_UserListService;
import kg.twojin.culturePark.common.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
public class Account_UrList_Controller {

    @Autowired
    Ad_UserListService ad_userListService;

    @RequestMapping(value = "memberListPage.ado")
    public ModelAndView memberList(HttpServletResponse response, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        List<MemberVO> memberVOList = ad_userListService.getMemberList();

        mv.addObject("memberVOList", memberVOList);
        mv.setViewName("ur_memberList");

        return mv;
    }

    @RequestMapping(value = "changeMbActive.ado")
    public void changeMbActive(@RequestParam("mq_seq")int mq_seq,

                               @RequestParam("mq_status") String mq_status) {




    }

}