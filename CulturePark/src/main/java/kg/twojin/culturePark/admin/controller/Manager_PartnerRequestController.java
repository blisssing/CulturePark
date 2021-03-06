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


        //  1 : ???????????? ???????????? ???????????? ????????? ??????
        HttpSession session = request.getSession();
        AdminVO adminvo = (AdminVO) session.getAttribute("admin");
        int ad_seq = adminvo.getAd_seq();
        partnerVO.setAd_seq(ad_seq);

        //  2-1 : ??????????????? ????????? ????????? ?????? ?????? ??????????????? ????????? ??? partnerVO??? ??????
        int randomNumber = randomNumberUtil.getRandomCode6();
        String dbPw = passwordEncoder.encode(Integer.toString(randomNumber));


        //  2-2 : ?????? ????????? ??????
        Date date = new Date();
        partnerVO.setPt_agreeDate(date);

        // 3. ?????? ????????? ??????
        ManagerVO managerVO = new ManagerVO(); // ?????? ????????? ??????
        managerVO = partnerService.createManagerAccount(partnerVO, dbPw);


        //  4: DB??? ??? ??????
        int dbResult = partnerService.agreePartnerRequest(partnerVO, managerVO);

        //  5 : ???????????? ?????? ????????? ?????? ?????? ?????? ??????
        boolean emailResult = false; // ????????? ?????? ??????

        if (dbResult == 1) { // DB??? ??? ????????? ???????????? ???????????? ????????? ???????????? ??????

            String title = "[" + partnerVO.getPt_comp_name() + "] ????????? ?????? ?????? ??????";
            // Todo : ??????!!! ????????? ????????? ?????? ???????????? ??? url ???????????? ???
            String text =
                    "?????? ????????? ?????? : " + partnerVO.getPt_email() +
                            "\n ?????? ???????????? : " + randomNumber +
                            "\n ????????? ????????? ?????? : http://localhost:8080/login.mdo";
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

        System.out.println("????????????");

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
