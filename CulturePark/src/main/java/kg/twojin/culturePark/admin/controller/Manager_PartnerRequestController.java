package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.EmailService;
import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.service.RandomNumberUtil;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.EmailVO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

@RestController
public class Manager_PartnerRequestController {

    @Autowired
    PartnerService partnerService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    EmailService emailService;

    @Autowired
    RandomNumberUtil randomNumberUtil;

    @RequestMapping(value = "mgPartnerRequest.ado")
    public ModelAndView partnerList(HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        List<PartnerVO> partnerList = partnerService.getAllPartnerRequest();
        HttpSession session = request.getSession();
        AdminVO vo = (AdminVO) session.getAttribute("admin");
        String adminIs = vo.getAd_is();


        if (adminIs.contains("manager") || adminIs.contains("super")) {
            mv.addObject("partnerList", partnerList);
            mv.setViewName("mg_requestList");
        } else {
            session.setAttribute("Error", "Proc");
            mv.setViewName("accessError.jsp");
        }

        return mv;
    }

    @RequestMapping(value = "agreePartnerRequest.ado")
    public void agreePartnerRequest(@RequestBody PartnerVO partnerVO,
                                    HttpServletResponse response, HttpServletRequest request)
            throws IOException {


        //  1 : 세션에서 로그인한 어드민의 정보를 다음
        HttpSession session = request.getSession();
        AdminVO adminvo = (AdminVO) session.getAttribute("admin");
        int ad_seq = adminvo.getAd_seq();
        partnerVO.setAd_seq(ad_seq);

        //  2-1 : 파트너에게 발급할 계정에 대한 임시 비밀번호를 설정한 후 partnerVO에 담음
        int randomNumber = randomNumberUtil.getRandomCode6();
        String dbPw = passwordEncoder.encode(Integer.toString(randomNumber));


        //  2-2 : 승인 날짜를 셋팅
        Date date = new Date();
        partnerVO.setPt_agreeDate(date);

        // 3. 루트 매니저 완성
        ManagerVO managerVO = new ManagerVO(); // 루트 매니저 객체
        managerVO = partnerService.createManagerAccount(partnerVO, dbPw);


        //  4: DB에 값 넣기
        int dbResult = partnerService.agreePartnerRequest(partnerVO, managerVO);

        //  5 : 이메일로 루트 매니저 계정 생성 정보 전달
        boolean emailResult = false; // 결과를 담을 변수

        if (dbResult == 1) { // DB에 값 넣기를 성공했을 경우에만 이메일 발송하게 설정

            String title = "[" + partnerVO.getPt_comp_name() + "] 파트너 요청 승인 안내";
            // Todo : 수정!!! 매니저 로그인 기능 구현했을 때 url 변경해줄 것
            String text =
                    "루트 매니저 계정 : " + partnerVO.getPt_email() +
                            "\n 초기 비밀번호 : " + randomNumber +
                            "\n 매니저 로그인 링크 : http://localhost:8080/login.mdo";
            String to = partnerVO.getPt_email();

            EmailVO emailVO = new EmailVO(to, title, text);
            emailResult = emailService.sendEmail(emailVO);
        }

        JSONObject json = new JSONObject();

        String controllerResult = "";

        if (dbResult == 1 && emailResult == true) {
            controllerResult = "success";
        } else {
            controllerResult = "false";
        }
        json.put("result", controllerResult);

        PrintWriter out = response.getWriter();
        out.print(json);


    }

    @RequestMapping(value = "downloadCompDoc.ado")
    public void downloadCompDoc(@RequestParam(value = "pt_comp_name") String  comp_name, @RequestParam("pt_file") String pt_file,
                                HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("실행확인");

        File file = null;
        byte[] bytes = null;

        file = partnerService.downloadFile(pt_file);
        bytes = FileUtils.readFileToByteArray(file);


        response.setContentType("application/octet-stream");
        response.setContentLength(bytes.length);

        response.setHeader("Content-Disposition", "attachment; fileName=\"" +
                URLEncoder.encode(comp_name, "UTF-8") + "\";");
        response.setHeader("Content_Transfer-Encoding", "binary");

        response.getOutputStream().write(bytes);
        response.getOutputStream().flush();
        response.getOutputStream().close();

    }
}
