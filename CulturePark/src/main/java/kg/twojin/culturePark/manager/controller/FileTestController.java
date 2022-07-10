package kg.twojin.culturePark.manager.controller;

import kg.twojin.culturePark.common.utils.UploadFileUtils;
import kg.twojin.culturePark.common.vo.ProductVO;
import lombok.Data;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class FileTestController {

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
                               HttpServletRequest request, HttpServletResponse response) {

        System.out.println("여기 실행");

        logger.info("파일 이름 : " + file.getOriginalFilename());
        logger.info("파일 확장자 : " + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.')));
        logger.info("받아온 정보 : " + vo.toString());
        logger.info("파일의 실제 데이터  : byte []data = file.getBytes()" );

        String uploadPath = "/Users/hanjinhui/Desktop/AWS/Main_Project/uploadFiles/PartnerInfo/";
        logger.info("업로드 패스 : " + uploadPath);

        UploadFileUtils uploadFileUtils = new UploadFileUtils();

        String folderPath = uploadFileUtils.makeFolder(uploadPath);
        logger.info(folderPath);
    }

}
