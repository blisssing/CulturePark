package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.Ad_UserListService;
import kg.twojin.culturePark.admin.service.SecurityService;
import kg.twojin.culturePark.common.vo.MemberVO;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RestController
public class Account_UrList_Controller {

    @Autowired
    Ad_UserListService ad_userListService;

    @Autowired
    SecurityService securityService;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    @RequestMapping(value = "memberListPage.ado")
    public ModelAndView memberList(HttpServletResponse response, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        List<MemberVO> memberVOList = ad_userListService.getMemberList();

        mv.addObject("memberVOList", memberVOList);
        mv.setViewName("ur_memberList");

        return mv;
    }

    @RequestMapping(value = "changeMbActive.ado")
<<<<<<< HEAD
    public void changeMbActive(HttpServletRequest request, HttpServletResponse response,
                               @RequestBody MemberVO memberVO) throws IOException {

        int result = ad_userListService.updateMemberActive(memberVO);
=======
    public void changeMbActive(@RequestParam("mq_seq")int mq_seq,

                               @RequestParam("mq_status") String mq_status) {
>>>>>>> 873c732985aa8cbfa86e0c1e1cda867497f0781f


        JSONObject json = new JSONObject();
        String result_str = "";

<<<<<<< HEAD
        if (result == 1) {
            result_str = "success";
        } else {
            result_str = "failed";
        }


        json.put("result", result_str);
        PrintWriter writer = response.getWriter();
        writer.print(json);
    }

    @RequestMapping(value = "getTemporaryKey.ado")
    public void getTemporaryKey(@RequestParam("mb_seq")String seq_str,
                                HttpServletResponse response) throws IOException {

        String tempKey=securityService.createTempKeyBySec();
        String encodeKey = bcryptPasswordEncoder.encode(tempKey);

        int result =ad_userListService.modifyMemberPassword(Integer.parseInt(seq_str), encodeKey);
        JSONObject json = new JSONObject();

        if (result == 1) {
            json.put("result", "success");
        } else {
            json.put("result", "failed");
        }

        PrintWriter out = response.getWriter();
        out.print(json);
=======

>>>>>>> 873c732985aa8cbfa86e0c1e1cda867497f0781f
    }

}