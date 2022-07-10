package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.admin.service.EmailService;
import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.service.RandomNumberUtil;
import kg.twojin.culturePark.common.vo.EmailVO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
public class MemberLoginController {

    @Autowired
    MemberDAO memberDAO;

    @Autowired
    MemberLoginService memberLoginService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    RandomNumberUtil randomNumberUtil;

    @Autowired
    EmailService emailService;


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

        /*  설계
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

    /*https://mylupin.tistory.com/47?category=792579*/
    @RequestMapping("/kakaoLogin.do")
    public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
        System.out.println("#########" + code);
        return "testPage";
    }

    @RequestMapping(value = "/findId.do")
    public ModelAndView getFindId() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id");
        return mv;
    }

    //아이디 찾기 실행
    @RequestMapping(value="/culturePark/findIdProc.do", method = RequestMethod.POST)
    public String findIdProc(@RequestBody MemberVO vo,
                             HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        //반환값 String(아이디값을 받아올것이므로) @RequestParam MemberVO(name값을 받아와 일치하는 변수에 넣어준다)
        //json이므로 RequestBody를 사용

        String result;

        vo = memberLoginService.memberFindId(vo);

        if(vo != null){

            //세션 생성
            HttpSession session = request.getSession();

            //넘겨줄 세션의 scope 다음 key값 만들어줌
            session.setAttribute("findEmail",vo.getMb_email());
            result = "success";


        }else {
            result = "failed";
            System.out.println("컨트롤러 실패");

        }
        return result;
    }


    @RequestMapping(value = "/findIdResult.do")
    public ModelAndView getFindIdResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_id_result");
        return mv;
    }


    @RequestMapping(value = "/findPw.do")
    public ModelAndView getFindPw() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw");
        return mv;
    }


    // TODO : application.properties에 putyouremail에 내 진짜 이메일과 비번 기재해서 실행할것.
    // https://recoderr.tistory.com/7
    @Transactional
    @RequestMapping(value = "/culturePark/findPwProc.do", method = RequestMethod.POST)
    public String getFindPwProc(@RequestBody MemberVO vo,
                                HttpServletRequest request, HttpServletResponse response) throws IOException {
        String result= null;


        System.out.println("컨트롤러 동작 확인");
        System.out.println(vo.toString());


        if(vo.getMb_email() != null) {  //입력값을 제대로 입력했다면,

            // 만약 널이 아니라면, 값을 정상적으로 받아왔다는 것 - > 이메일 방식으로 비밀번호 찾기
            vo = memberLoginService.memberFindPw_Email(vo);

        } else if(vo.getMb_tel() != null) {
            // 위와 동일한 원리
            vo = memberLoginService.memberFindPw_Phone(vo);
        }

        // 이메일 인증 : https://recoderr.tistory.com/7

        // 동일한 동작의 코드는 한 번만
        HttpSession session = request.getSession();

        if( vo!=null ){

            result = "success";

        }else {

            result = "failed";
        }
        session.setAttribute("findPw", result);

        return result;
    }

    @RequestMapping(value = "/findPwResult.do")
    public ModelAndView getFindPwResult() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member_find_pw_newPw");
        return mv;
    }


    // 인증 이메일 보내기
    @ResponseBody
    @RequestMapping(value="/culturePark/chkEmailSms.do",method = RequestMethod.POST)
    public String sendSmsM(@RequestBody MemberVO vo, @RequestParam("email") String emailNumber, HttpServletResponse response) throws Exception {

        int randomNumber = randomNumberUtil.getRandomCode6();

        boolean emailResult = false; //결과 담을 변수

        String title = "[culture park] 비밀번호변경 인증 이메일 입니다";

        String text = "안녕하세요 회원님, 비밀번호변경 인증코드를 발급하였습니다." +
                "\n 초기 비밀번호 : " + randomNumber +
                "\n 로그인 링크 : http://localhost:8080/login.mdo";
        
        String to = vo.getMb_email();

        EmailVO emailVO = new EmailVO(to,title,text);
        
        emailResult = emailService.sendEmail(emailVO);
        
     /*       JSONObject json = new JSONObject();*/

            String controllerResult  = "";

            if(emailResult){ // true이면
                controllerResult = "success";
            } else {
                controllerResult = "false";

                /*PrintWriter out = response.getWriter();
                out.print(json);*/
            }
            
            return controllerResult;
        /*Integer.toString(randomNumber);*/



    }


    // 인증 문자 보내기
    @ResponseBody
    @RequestMapping(value = "/culturePark/chkPhoneSms.do", method = RequestMethod.POST)
    public String sendSms(@RequestParam("phone") String phoneNumber, HttpServletResponse response) throws Exception {

        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000); // 난수 생성
        memberLoginService.certifiedPhoneNumber(phoneNumber, randomNumber);
        return Integer.toString(randomNumber);
    }


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