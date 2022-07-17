package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.CompanyVO;

import java.util.List;

public interface Ad_ManagerAccountService {


    // 조회
    List<ManagerVO> getManagerList();

    CompanyVO getCompanyInfo(int comp_seq);

    int deleteManager(ManagerVO managerVO);

    ManagerVO getManagerInfoByEmail(String mg_email);


}
