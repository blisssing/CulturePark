package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.EmailService;
import kg.twojin.culturePark.admin.service.Partner_RequestService;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.EmailVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RestController
public class Manager_PartnerRequestController {

    @Autowired
    Partner_RequestService partner_requestService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    Autowired
    EmailService emailService;

    @RequestMapping(value = "mgPartnerRequest.ado")
    public ModelAndView partnerList(HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        List<PartnerVO> partnerList = partner_requestService.getAllPartnerRequest();
//        HttpSession session =request.getSession();
//        AdminVO vo=(AdminVO) session.getAttribute("admin");

//        String adminIs = vo.getAd_is();

        for (PartnerVO part : partnerList) {
            System.out.println(part.toString());
        }

//        if (adminIs.contains("manager") || adminIs.contains("super")) {
            mv.addObject("partnerList", partnerList);
            mv.setViewName("mg_requestList");
//        } else {
//            session.setAttribute("Error", "Proc");
//            mv.setViewName("accessError.jsp");
//        }

        return mv;
    }

    @RequestMapping(value = "agreePartnerRequest.ado")
    public void agreePartnerRequest(@RequestBody PartnerVO partnerVO,
                                    HttpServletResponse response, HttpServletRequest request) {

        HttpSession session = request.getSession();
//        AdminVO vo = (AdminVO) session.getAttribute("admin");
//        int ad_seq = vo.getAd_seq();
/       // 승인 어드민 셋팅
        int ad_seq = 1;
        System.out.println("어드민 번호 : " + ad_seq);
        partnerVO.setAd_seq(ad_seq);

        // 난수 생성
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000); // 난수 생성
        String dbPw =   passwordEncoder.encode(Integer.toString(randomNumber));
        partnerVO.setPt_pw(dbPw);

        // 승인 날짜 셋팅

        Date date = new Date();
        partnerVO.setPt_agreeDate(date);

        // DB에 값 넣기
        int result = partner_requestService.agreePartnerRequest(partnerVO);


        // Todo : 비번 이메일로 보내기

        String title ="["+partnerVO.getPt_comp_name() + "] 파트너 요청 승인 안내";
        String text = "루트 매니저 계정 : " + partnerVO.getPt_email()+
                        "\n초기 비밀번호 : " + ;
        String to = partnerVO.getPt_email();

        EmailVO emailVO = new EmailVO();

        if (result == 1) {

        }




    }
}
