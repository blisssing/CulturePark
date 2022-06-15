package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.dao.AdminDAO;
import kg.twojin.culturePark.admin.service.AdminManageService;
import kg.twojin.culturePark.admin.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class Admin_LoginController {

    @Autowired
    AdminDAO adminDAO;

    @Autowired
    AdminManageService adminManageService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;




    // 처음 로그인할 때 들어오는 페이지
    @RequestMapping(value = "/culturePark/all/loginForm.ado")
    public ModelAndView adLoginForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_login_Form");
        return mv;
    }


    // 파라미터의 키값에 해당하는 val을 자동적으로 변수(adminID, adminPW)에 담음. 변수들을 mv에 보낸 다음 페이지 이름과 함께 return
    @RequestMapping(value = "/culturePark/admin/loginProc.ado", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView adLoginProc(@ModelAttribute("adminVO") AdminVO adminVO,
                                    RedirectAttributes rAttr, // 로그인 실패 시 다시 로그인 창으로 리다이렉트
                                    HttpServletRequest request, HttpServletResponse response) throws Exception {


        System.out.println("로그인 동작 수행 !!");

        request.setCharacterEncoding("utf-8");

        ModelAndView mv = new ModelAndView();

        // DB에서 조회해서 가져온 어드민 vo
        AdminVO vo = adminManageService.loginAdmin(adminVO);

        if (vo != null) { // null => 값을 가져오는 데에 실패함 -> DB에 일치하는 데이터가 없음

            // DB에서 입력한 email과 일치하는 데이터가 있다면 비밀번호를 비교해야 함
            // matches(입력한 비밀번호, 이미 암호화된 비밀번호) = > true : 일치 = > 로그인 성공

            String dbPw = vo.getAd_pw();            // 암호화된 pw
            String password = adminVO.getAd_pw();   // 입력된 pw

            //            System.out.println("db암호화 : " + dbPw);
            //            System.out.println("입력된 비밀번호 : " + password);

            if (passwordEncoder.matches(password, dbPw)) {
                System.out.println("로그인성공");
                HttpSession session = request.getSession();
                session.setAttribute("admin", adminVO);
                session.setAttribute("isLogOn", true);
                mv.setViewName("redirect:/index.ado");
            } else {
                System.out.println("로그인실패");
                rAttr.addAttribute("result", "loginFailed");
                mv.setViewName("redirect:/culturePark/all/loginForm.ado");
            }
        } else {
            rAttr.addAttribute("result", "loginFailed");
            mv.setViewName("redirect:/culturePark/all/loginForm.ado");
        }

        return mv;
    }

    /*@RequestMapping(value = "loginProc.ado", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView adLoginProc(HttpServletRequest request, HttpServletResponse response)  throws Exception{
        request.setCharacterEncoding("utf-8");
        String adminID = request.getParameter("ad_email");
        String adminPW = request.getParameter("ad_pw");

        ModelAndView mv = new ModelAndView();
        mv.addObject("adminID", adminID);
        mv.addObject("adminPW", adminPW);

        mv.setViewName("ad_result");
        return mv;
    }*/

    @RequestMapping(value = "logout.ado")
    public ModelAndView adLogout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        session.removeAttribute("isLogOn");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/loginForm.ado");
        return mv;
    }
}
