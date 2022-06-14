package kg.twojin.culturePark.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class Admin_LoginController {


    // 처음 로그인할 때 들어오는 페이지
    @RequestMapping(value = "loginForm.ado")
    public ModelAndView adLoginForm(HttpServletRequest request, HttpServletResponse response)
                            throws Exception    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("ad_login_Form");
        return mv;
    }


    // 파라미터의 키값에 해당하는 val을 자동적으로 변수(adminID, adminPW)에 담음. 변수들을 mv에 보낸 다음 페이지 이름과 함께 return
    @RequestMapping(value = "loginProc.ado", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView adLoginProc( @RequestParam("ad_email") String adminID, @RequestParam("ad_pw") String adminPW,
                                    HttpServletRequest request, HttpServletResponse response)  throws Exception {
        request.setCharacterEncoding("utf-8");
        ModelAndView mv = new ModelAndView();
        mv.addObject("adminID", adminID);
        mv.addObject("adminPW", adminPW);

        mv.setViewName("ad_result");
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


}
