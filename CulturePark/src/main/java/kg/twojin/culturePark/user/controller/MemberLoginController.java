package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
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

    @ResponseBody //restController를 써주면 생략가능
    @RequestMapping(value="/loginProc.do", method = {RequestMethod.POST})
    public String  loginProc(@RequestBody MemberVO vo,
                                  HttpServletRequest request,
                                  HttpServletResponse response) throws Exception {
        // RequestParam: 하나씩만 가져옴
        // ModelAttribute: 하나의 뭉텅이로 움직임. 파라미터이름과 뒤에 따라오는 멤버객체이름이 같으면 자동으로 값을 이어준다. null값은 상관X

        /* Todo : 설계
                 1. 로그인 정보를 가져옴. 아이디랑 비밀번호
                 2. 두 가지 정보를 통해서 DB에 일치하는 녀석이 있는지 확인함.
                 3. 있으면 일치하는 값 전체를 VO에 담아서 최종단계인 컨트롤러까지 반환함.
                 4. 처음 아이디랑 비밀번호를 담았을 때 썼던 VO는 DB에서 반환되는 VO에 얹혀져도 상관이 없음.
        * */
        String voPw = vo.getMb_pw(); //사용자 pw

        vo = memberLoginService.memberLogin(vo); //DB

        String result;
        String loginChk;
        HttpSession session = request.getSession();

       /* JSONObject json = new JSONObject();*/
        if (vo != null) {
            String dbPw = vo.getMb_pw(); // DB에서 가져온 pw

            if (passwordEncoder.matches(voPw, dbPw)) {  //boolean으로 결과값 반환
                result = "success";
                loginChk = "logOn";
                session.setAttribute("loginChk", loginChk);
                session.setAttribute("member", vo);

            } else {
                result = "wrongPW";
            }
        } else {
            result = "wrongEmail";
        }
        return result;
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
