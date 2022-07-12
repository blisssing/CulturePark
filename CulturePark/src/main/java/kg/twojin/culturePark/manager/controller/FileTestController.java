package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.utils.FileUtilTwojin;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

@Controller
public class FileTestController {


    @Autowired
    PartnerService partnerService;


//https://velog.io/@jyyoun1022/SPRING파일-업로드-처리

    Logger logger = LogManager.getLogger(FileTestController.class);
    @RequestMapping(value = "testFile.mdo")
    public ModelAndView testFileUpload() {

        logger.info("여긴 testFile.mdo");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("testFileUpload");


        return mv;
    }

    @RequestMapping(value = "/uploadFile.mdo", method = RequestMethod.POST, consumes = "multipart/form-data")
    @ResponseBody
    public void pathTestMethod(@RequestPart("key") ProductVO vo, @RequestPart("file") MultipartFile file,
                               HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("여기 실행");

        logger.info("파일 이름 : " + file.getOriginalFilename());
        logger.info("파일 확장자 : " + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.')));
        String fileForm = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));

        logger.info("받아온 정보 : " + vo.toString());
        logger.info("파일의 실제 데이터  : byte []data = file.getBytes()" );
        byte[] data = file.getBytes();


        //Todo : AWS 저장소 경로로 수정해줄 것 .
        String uploadPath = "/Users/hanjinhui/Desktop/AWS/Main_Project/uploadFiles/PartnerInfo"; // 맥북용 테스트 패스

        String realPath = request.getServletContext().getRealPath("/");
        logger.info("절대 경로 : " + realPath);

        //String uploadPath = ""; // 윈도우용 패스
        //String uploadPath = ""; // AWS 패스
        logger.info("업로드 패스 : " + uploadPath);

        FileUtilTwojin fileUtils = new FileUtilTwojin();

        String folderPath = fileUtils.makeFolder(uploadPath);
        String fullPath = uploadPath + File.separator + folderPath;
        logger.info(fullPath);

//        boolean  result = uploadFileUtils.fileUpload(fullPath, fileForm, file);


//        File newFile = new File(fullName);
//
//        try {
//            file.transferTo(newFile);
//            logger.info("업로드 성공");
//        } catch (IllegalStateException e) {
//            e.printStackTrace();
//            logger.info("업로드 실패");
//        }



    }


    @RequestMapping(value = "testDownload.mdo")
    @ResponseBody
    public String  downloadFileTest(@RequestParam(value = "pt_file") String pt_file, @RequestParam(value="pr_comp_name")String comp_name,
                                    HttpServletRequest request, HttpServletResponse response) throws IOException {

        // https://to-dy.tistory.com/101

        logger.info("파일 명 : " + pt_file);

        byte[] fileByte=partnerService.downloadFile(pt_file);

        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        response.setHeader("Content-Disposition" , "attachment; fileName\""+ URLEncoder.encode(comp_name,"UTF-8")+"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");

        response.getOutputStream().write(fileByte);
        response.getOutputStream().flush();
        response.getOutputStream().close();



        return "hi";
    }





}
