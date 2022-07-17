package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.AdminDAO;
import kg.twojin.culturePark.common.dao.ProductCreateLogDAO;
import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.service.FileUploaderService;
import kg.twojin.culturePark.common.utils.FileUtilTwojin;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.ProductLogVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.manager.service.ManagerProductManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service("managerProductManageService")
public class ManagerProductManageServiceImpl implements ManagerProductManageService {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    ProductCreateLogDAO productCreateLogDAO;

    @Autowired
    AdminDAO adminDAO;

    @Autowired
    FileUtilTwojin fileUtilTwojin;

    @Override
    public int createNewProductRequest(ProductVO productVO) {


        return productDAO.insertProductRequest(productVO);
    }

    @Override
    public HashMap<String, String> uploadEssentialFiles(HashMap<String, MultipartFile> fileHashMap) {

        // 멤버 변수
        HashMap<String, String> dbPathMap = new HashMap<>();
        Iterator it = fileHashMap.entrySet().iterator();


        String fullPath = null; // 각 파릴들의 풀 경로
        String dicName = null; // 각 파일들이 들어갈 폴더 이름

        boolean resultUpload = false;

        // root  경로
        String thumb_uploadPath = "/Users/hanjinhui/Desktop/AWS/Main_Project/uploadFiles/Pr_thumb/";
        String descript_uploadPath = "/Users/hanjinhui/Desktop/AWS/Main_Project/uploadFiles/Pr_descript/";
        String mainImg_uploadPath = "/Users/hanjinhui/Desktop/AWS/Main_Project/uploadFiles/Pr_mainImg/";

        // 파일 이름
        String file_common_Name = fileUtilTwojin.getRandomName();

        while (it.hasNext()) { // Iterator 에 다음 값이 있다면 계속 반복

            Map.Entry<String, MultipartFile> entry = (Map.Entry) it.next(); // Iterator에서 아무거나 뽑음
            String key =entry.getKey(); //
            MultipartFile file = entry.getValue();

            String fileForm = fileUtilTwojin.getFileForm(file); // Util을 통해서 파일의 확장자를 뽑음

            // 키 값에 따라 저장 위치가 다름.
            switch (key) {
                case "thumbNail":
                    dicName= fileUtilTwojin.makeFolder(thumb_uploadPath);
                    dbPathMap.put("thumb", dicName + File.separator + file_common_Name+"."+fileForm);
                    fullPath = thumb_uploadPath + File.separator + dicName;
                    break;

                case "descript":
                    dicName = fileUtilTwojin.makeFolder(descript_uploadPath);
                    dbPathMap.put("descript", dicName + File.separator + file_common_Name+"."+fileForm);
                    fullPath = descript_uploadPath + File.separator + dicName;
                    break;

                case "mainImg":
                    dicName = fileUtilTwojin.makeFolder(mainImg_uploadPath);
                    dbPathMap.put("mainImg", dicName + File.separator + file_common_Name+"."+fileForm);
                    fullPath = mainImg_uploadPath + File.separator + dicName;
                    break;
            }

            try {
                fileUtilTwojin.fileUpload(file_common_Name, fullPath, fileForm, file);
                resultUpload = true;
            } catch (IllegalStateException e) {
                e.printStackTrace();
                resultUpload = false;
                break;
            } catch (IOException e) {
                resultUpload = false;
                e.printStackTrace();
                break;
            }
        }

        if (!resultUpload) {
            return null;
        }
        return dbPathMap;
    }

    @Override
    public List getAllProductCreateRequestList(int pt_num) {
        return productDAO.selectAllOnwPdCreateRequest(pt_num);
    }

    @Override
    public ProductLogVO getProductLogByPdrSeq(int pdr_seq) {
        ProductLogVO productLogVO = productCreateLogDAO.selectProductLogByPdrSeq(pdr_seq);
        int ad_seq = productLogVO.getAd_seq();

        AdminVO adminVO = adminDAO.selectAdminEmailTel(ad_seq);
        productLogVO.setAd_email(adminVO.getAd_email());
        productLogVO.setAd_tel(adminVO.getAd_tel());

        return productLogVO;
    }


}
