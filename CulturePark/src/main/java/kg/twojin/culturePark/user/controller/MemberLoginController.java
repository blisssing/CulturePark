package kg.twojin.culturePark.user.controller;


import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class MemberLoginController {

    @Autowired
    MemberDAO memberDAO;

    @Autowired
    MemberLoginService memberLoginService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    
    

    // 처음 로그인 할때 들어오는 페이지
    @RequestMapping(value = "/login.do")
    public ModelAndView getLoginPage(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_login");
        return mv;
    }


    @RequestMapping(value="/loginProc.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView loginProc(@RequestParam Map<String,String> loginMap,
                                  HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {
        // RequestParam: 하나씩만 가져오거나 Map형식으로 가져올 수 있다.
        // ModelAttribute: 하나의 뭉텅이로 움직임. 파라미터이름과 뒤에 따라오는 멤버객체이름이 같으면 자동으로 값을 이어준다. null값은 상관X
        ModelAndView mv = new ModelAndView();
        
        memberVO = memberLoginService.login(loginMap); //SQL문으로 전달
        
        if(memberVO != null && memberVO.getMb_email() != null){
            
            HttpSession session = request.getSession();  //조회한 회원정보를 가져와 isLogOn속성, memberInfo속성에 저장
            session = request.getSession();
            session.setAttribute("isLogOn", true);
            session.setAttribute("memberInfo",memberVO);

            String action = (String)session.getAttribute("action");
            if(action != null && action.equals("/exhibitMain.do")){
                mv.setViewName("forward:"+action);
            }else {
                mv.setViewName("redirect:/home.do");
            }
        }else {
            String message="아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
            mv.addObject("message",message);
            mv.setViewName("/member_login");
        }
        return mv;
    }

    @RequestMapping(value="/overlapped.do" , method= RequestMethod.POST)
    public ResponseEntity overlapped(@RequestParam("mb_email") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ResponseEntity resEntity = null;
        String result = memberLoginService.overlapped(id);
        resEntity = new ResponseEntity(result, HttpStatus.OK);
        return resEntity;

    }

    @RequestMapping(value="/findId.do")
    public ModelAndView getFindId(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id");
        return mv;
    }

    @RequestMapping(value="/findPw.do")
    public ModelAndView getFindPw(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw");
        return mv;
    }

    @RequestMapping(value="/findIdResult.do")
    public ModelAndView getFindIdResult(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id_result");
        return mv;
    }

    @RequestMapping(value="/findPwResult.do")
    public ModelAndView getFindPwResult(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw_result");
        return mv;
    }



}
