package kg.twojin.culturePark.common.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface FileUploaderService {

    public boolean  uploadPartnerRequest(MultipartFile file, String uploadPath,String folderName,String randomName) throws IOException;

    public String getRandomFileName();

    public String getFileForm(MultipartFile file);

    public String getSaveDirectory(String uploadPath);



}
