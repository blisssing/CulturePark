package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.common.vo.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;

public interface ManagerProductManageService {

    int createNewProductRequest(ProductVO productVO);

    List<ProductRequestVO> getAllProductCreateRequestList(int pdr_seq);

    ProductLogVO getProductLogByPdrSeq(int pt_seq);

    HashMap<String, String> uploadEssentialFiles(HashMap<String, MultipartFile> fileHashMap);

}
