package kg.twojin.culturePark.user.controller;


import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.user.service.MemberJoinService;
import kg.twojin.culturePark.user.service.PartnerJoinService;
import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

//https://wakestand.tistory.com/361
@RestController
public class SellerPageController {
    @Autowired
    MemberJoinService memberJoinService;

    @Autowired
    MemberDAO memberDAO;

    @Autowired
    PartnerJoinService partnerJoinService; //service와 연결


    @RequestMapping(value = "/partnerRequest.do")
    public ModelAndView registSeller() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("partner_request");
        return mv;
    }

    //휴대폰 문자 보내기
    @RequestMapping(value = "/telCheck.do", method = RequestMethod.POST)
    public String sendSMS(@RequestParam("phone") String userTelNumber) {
        System.out.println("sms Send 실행확인");

        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);//난수생성
        memberJoinService.certifiedPhoneNumber(userTelNumber, randomNumber);
        return Integer.toString(randomNumber);
    }

    //이메일 중복 검사
    //https://yejip.com/web/2020-12-15-%EA%B2%8C%EC%8B%9C%ED%8C%90ajax1/
    @RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
    public String checkEmail(@RequestParam("email") String userEmail) {
        //String: 반환자료형,   email: input name 또는 js에서 data:key값,    String userEmail: 새로운 변수를 만듬

        String email = null;
        email = partnerJoinService.chkEmailFromPartner(userEmail);
        // service에 접근하여 해당 메소드와 변수명으로 값을 넘긴다.

        // Todo : 서비스를 통해 반환받은 email에 값이 들어가 있는지 없는지 확인을 해주는 코드를 작성해줄 것.
        /* email = "blisssing@naver.com";*/

        if (email == "" || email == null) { //DB에 값이 없을경우 새로운 이메일형식임
            System.out.println("올바른 이메일입니다.");
        } else {
            email = "error"; //DB에 값이 있을경우 error라는 문구를 만들어준다.
            System.out.println("중복된 이메일입니다.");
        }
        return email;
    }

    //파일 업로드


/*    @RequestMapping(value = "/sellerUpload.do")
    public String uploadFile(HttpServletRequest request, @RequestParam("pt_file") MultipartFile imgFile,
                             Model model) {

        String savePath = request.getRealPath("/Desktop/"); // 파일이 저장될 프로젝트 안의 폴더 경로
        String originalFilename = imgFile.getOriginalFilename(); // fileName.png
        String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
        String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg or .png

        String rename = onlyFileName + "_" + getCurrentDayTime() + extension;
        // fileName_20220604-17-00-15.png
        String fullPath = savePath + "\\" + rename;

        if (!imgFile.isEmpty()) {
            try {
                byte[] bytes = imgFile.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
                stream.write(bytes);
                stream.close();
                model.addAttribute("resultMsg", "파일을 업로드 성공!!");
            } catch (Exception e) {
                model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
            }
        } else {
            model.addAttribute("resultMsg", "업로드할 파일을 선택해주시길 바랍니다.");
        }
        return "jspPage";
    }

    public String getCurrentDayTime() {
        long time = System.currentTimeMillis();
        SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss",
                Locale.KOREA);
        return dayTime.format(new Date(time));
    }*/


    @RequestMapping(value = "/partnerRequestProc.do")
    public ModelAndView ptRequestProc(@ModelAttribute("partnerVO") PartnerVO insertedVO,
                                      HttpServletResponse response, HttpServletRequest request) {

        System.out.println("partnerRequestProc 동작 확인");
        ModelAndView mv = new ModelAndView();

        // 오늘 날짜 셋팅
        Date date = new Date();
        insertedVO.setPt_createDate(date);

        int result = partnerJoinService.insertPartner(insertedVO);

        if (result == 1) {
            mv.setViewName("redirect:/login.mdo");
            System.out.println("회원가입 성공!");
        } else {
            mv.setViewName("redirect:/index.mdo");
            System.out.println("회원가입 실패");
        }

        return mv;
    }

}


