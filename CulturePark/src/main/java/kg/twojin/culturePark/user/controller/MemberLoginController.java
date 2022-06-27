package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

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
    @RequestMapping(value = "/loginProc.do", method = {RequestMethod.POST})
    public String loginProc(@RequestBody MemberVO vo,
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

        /* 사용자가 입력한 정보 */
        String voPw = vo.getMb_pw();

        /* DB정보 셋팅 */
        vo = memberLoginService.memberLogin(vo);


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


    /* 로그인 기억하기 */
   /* @PostMapping("/postMethod")
    public String Login_remember (
            LoginCommand loginCommand, HttpServletResponse response) {

        Cookie rCookie = new Cookie("cEmail", loginCommand.getEmail());
        rCookie.setPath("/");

        if (loginCommand.isRememberEmail()) {
            rCookie.setMaxAge(60 * 60 * 24 * 15);
        } else {
            rCookie.setMaxAge(0);
        }

        response.addCookie(reCookie);

        return "login/loginSuccess";

    }*/

    @RequestMapping(value = "/findId.do")
    public ModelAndView getFindId() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id");
        return mv;
    }

    @RequestMapping(value = "/findPw.do")
    public ModelAndView getFindPw() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw");
        return mv;
    }

    @RequestMapping(value = "/findIdResult.do")
    public ModelAndView getFindIdResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id_result");
        return mv;
    }

    @RequestMapping(value = "/findPwResult.do")
    public ModelAndView getFindPwResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw_result");
        return mv;
    }


    /*https://kimvampa.tistory.com/135*/
   /* @RequestMapping(value = "logout.do", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그아웃 되었습니다.')");
        out.flush();
        return "/user/member_login";
    }*/

    /*https://dlgkstjq623.tistory.com/251?category=786635*/
    @RequestMapping("logout.do") //logout.do에 매핑
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
       /* memberService.logout(session); //세션 초기화 작업*/

        HttpSession session = request.getSession();
        ModelAndView mav = new ModelAndView();
        session.invalidate();
        mav.setViewName("redirect:/home.do"); //이동할 페이지의 이름
        mav.addObject("message","logout"); //변수 저장
        return mav; //페이지로 이동
    }

}
