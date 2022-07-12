package kg.twojin.culturePark.common.service.impl;

import kg.twojin.culturePark.common.service.FileUploaderService;
import kg.twojin.culturePark.common.utils.FileUtilTwojin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service("fileUploaderService")
public class FileUploaderServiceImpl implements FileUploaderService {


    @Autowired
    FileUtilTwojin fileUtilTwojin;

    @Override
    public String getSaveDirectory(String uploadPath) {
        return fileUtilTwojin.makeFolder(uploadPath);
    }

    @Override
    public boolean  uploadPartnerRequest(MultipartFile file, String uploadPath, String folderName, String randomName) throws IOException{

        boolean result;

        String fileForm = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
        String fullPathName = uploadPath +File.separator+folderName;
        boolean saveResult= fileUtilTwojin.fileUpload(randomName,fullPathName, fileForm, file);

        return saveResult;
    }

    @Override
    public String getRandomFileName() {
        return fileUtilTwojin.getRandomName();
    }

    @Override
    public String getFileForm(MultipartFile file) {
        return fileUtilTwojin.getFileForm(file);
    }




}
