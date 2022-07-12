package kg.twojin.culturePark.common.utils;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Component
public class FileUtilTwojin {


    static final int WIDTH = 300;
    static final int HEIGHT = 300;

    public boolean fileUpload(String randomName , String fullPathName, String fileForm, MultipartFile file) throws IOException {

        String newFileName = randomName;
        String fileFullName = fullPathName + File.separator + newFileName+ fileForm;

        File newFile = new File(fileFullName);

        try {
            file.transferTo(newFile);
            return true;
        } catch (IllegalStateException e) {
            e.printStackTrace();
            return false;
        }

    }

    public File getFileByPath(String rootPath, String filePath) {
        String fullPath = rootPath + File.separator + filePath;
        System.out.println("경로 :     " + rootPath +File.separator+filePath);
        File donwloadFile = new File(fullPath);
        return donwloadFile;
    }


    public String makeFolder(String uploadPath) {
        String folderPath = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

        uploadPath +=folderPath;

        // 폴더 생성
        File uploadFilePath = new File(uploadPath);

        if (!uploadFilePath.isDirectory()) {
            System.out.println("생성");
            uploadFilePath.mkdirs();
        }
        return folderPath;
    }

    public String getRandomName() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

    public String getFileForm(MultipartFile file) {
        return file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
    }



}
