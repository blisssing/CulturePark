package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;

import java.io.File;
import java.io.IOException;
import java.util.List;

public interface PartnerService {
    List<PartnerVO> getAllPartnerRequest();

    List<PartnerVO> getAllPartner();

    ManagerVO createManagerAccount(PartnerVO partnerVO, String encodePw);

    int agreePartnerRequest(PartnerVO partnerVO,ManagerVO managerVO);

    PartnerVO getPartnerBySeq(int pt_seq);

    File downloadFile(String  pr_file) throws IOException;

}
