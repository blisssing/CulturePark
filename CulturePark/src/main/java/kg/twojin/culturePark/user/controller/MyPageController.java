package kg.twojin.culturePark.user.controller;

import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberJoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@Controller
public class MyPageController {

    @Autowired
    MemberJoinService memberJoinService;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    @RequestMapping(value = "/myTicket.do")
    public ModelAndView getMyTicket() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_myTicket");
        return mv;
    }

    @RequestMapping(value = "/viewDetail.do")
    public ModelAndView getViewDetail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_viewDetail");
        return mv;
    }

    @RequestMapping(value = "/viewTicket.do")
    public ModelAndView getViewTicket() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_viewTicket");
        return mv;
    }

    @RequestMapping(value = "/viewCancel.do")
    public ModelAndView getViewCancel() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_viewCancel");
        return mv;
    }

    @RequestMapping(value = "/likeList.do")
    public ModelAndView getLikeList() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_likeList");
        return mv;
    }

    @RequestMapping(value = "/pointPage.do")
    public ModelAndView getPoint() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_pointPage");
        return mv;
    }

    @RequestMapping(value = "/myReview.do")
    public ModelAndView getReview() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_myReview");
        return mv;
    }

    @RequestMapping(value = "/myInfo.do")
    public ModelAndView myInfoPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_myInfo");
        return mv;
    }

    @RequestMapping(value="/myInfoLoginProc.do", method = RequestMethod.POST)
    @ResponseBody
    public String innerLogin(@RequestParam("innerPw") String userPw, HttpServletResponse response){
                                    //js data key값 또는 input name값

        /* Todo : 로직
            1. 비밀번호 재입력을 통해, 참 거짓인지만 판별하면 됨.
            2. 복잡한 과정 없이, session에 저장돼 있는 vo를 통해서 비교 연산을 하면 됨
            3. 만약 같으면 페이지에 접근할 수 있도록 하면 됨.
            4. 그래서 vo의 비밀번호와 사용자가 입력한 비밀번호를 비교하고 결과를 String 객체로서 반환하면 됨.
            ==> DB에 들어갔다 나올 필요가 없어 간단하고 효율적이고 비용 절약적인 방법
        * */

        /*Todo :
        *  1. 사용자한테 이메일(email)과 비밀번호(pw)를 입력 받음
        *  2. 해당 하는 정보가 vo에 담겨져 session에 머무리게 됨.
        *  3. 나중에 비밀번호가 일치하는지 확인하기 위해서는 session에 접근하여 비밀번호가 일치하는지 확인해야 함.
        *  4. 그러기 위해서 필요한 것은 (1) 재확인을 위해 사용자가 입력한 패스워드
        *  5. 하지만 사용자가 입력한 패스워드는 암호화 이전의 패스워드이고, vo 안에 있는 패스워드는 암호화 상태의 패스워드다.
        *  6. 그래서 비교를 하기 위해서는 둘이 같은 암호인지 판별하는 기능을 사용해야 하는데...
        *  7. 다행히 이 기능을 Spring Security : BcryptPasswordEncoder 에서 지원해주고 있다. 왜냐면 애초에 암호화를 Spring security가 해주고 있기 때문이다.*/

        MemberVO vo = new MemberVO();
        vo.setMb_pw("$2a$10$J992YpBvEszVI.CytuSO7.g6MHiGAQxBP675ZOCi6wfQrfF/Zymra");;
        if (bcryptPasswordEncoder.matches(userPw, vo.getMb_pw())) {
            System.out.println("같은 비밀번호!!");
            return "success";
        } else {
            System.out.println("인증 실패!!");
            return "failed";
        }


        // todo : 세션에서 로그인 정보를 불러오고, 로그인 정보를 통해 입력된 비밀번호가 일치하는지
        //   로직을 새워줄 것

        // 이메일을 가지고 들어가, 이메일에 해당하는 데이터의 비밀번호를 가져와주게 할 것.

        // Todo : 서비스를 통해 반환받은 email에 값이 들어가 있는지 없는지 확인을 해주는 코드를 작성해줄 것.

      }

    @RequestMapping(value = "levelPage.do")
    public ModelAndView myLevel() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("myPage_levelPage");
        return mv;
    }
}
