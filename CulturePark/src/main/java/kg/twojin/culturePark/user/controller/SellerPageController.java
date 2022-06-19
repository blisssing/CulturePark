package kg.twojin.culturePark.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//https://wakestand.tistory.com/361
@Controller
public class SellerPageController {

    @RequestMapping(value = "/registSeller.do")
    public ModelAndView registSeller() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("seller_regist");
        return mv;
    }

//    @RequestMapping(value = "/sellerUpload.do")
//    public String uploadFile(HttpServletRequest request, @RequestParam("imgFile")MultipartFile imgFile,
//                             Model model) {
//
//        String savePath = request.getRealPath("/Desktop/"); // 파일이 저장될 프로젝트 안의 폴더 경로
//        String originalFilename = imgFile.getOriginalFilename(); // fileName.png
//        String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
//        String extension =
//                originalFilename.substring(originalFilename.indexOf(".")); // .jpg or .png
//
//        String rename = onlyFileName + "_" + getCurrentDayTime()+extension;
//        // fileName_20220604-17-00-15.png
//        String fullPath = savePath + "\\" + rename;
//
//        if (!imgFile.isEmpty()) {
//            try {
//                byte[] bytes = imgFile.getBytes();
//                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
//                stream.write(bytes);
//                stream.close();
//                model.addAttribute("resultMsg", "파일을 업로드 성공!!");
//
//            } catch (Exception e) {
//                model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
//            }
//
//        } else {
//            model.addAttribute("resultMsg", "업로드할 파일을 선택해주시길 바랍니다.");
//        }
//
//        return "jspPage";
//
//    }
//
//    public String getCurrentDayTime() {
//        long time = System.currentTimeMillis();
//        SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss",
//                Locale.KOREA);
//        return dayTime.format(new Date(time));
//    }

}
