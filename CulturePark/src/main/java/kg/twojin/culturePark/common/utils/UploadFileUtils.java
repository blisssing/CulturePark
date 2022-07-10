package kg.twojin.culturePark.common.utils;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class UploadFileUtils {


    static final int WIDTH = 300;
    static final int HEIGHT = 300;

    public static String fileUpload(String uploadPath,
                                    String fileName, byte[] fileData) {

        System.out.println("uploadPaht : " + uploadPath);
        System.out.println("fileName = " + fileName);

        UUID uuid = UUID.randomUUID();
        String newFilename = uuid + "_" + fileName;
        String path = uploadPath;

        return null;
    }

    public static String makeFolder(String uploadPath) {
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


}
