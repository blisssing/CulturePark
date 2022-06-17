package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.manager.vo.ManagerVO;
import kg.twojin.culturePark.vo.CompanyVO;

import java.util.List;

public interface Ad_ManagerListService {


    // 조회
    List<ManagerVO> getManagerList();

    CompanyVO getCompanyInfo(int comp_seq);


    int deleteManager(ManagerVO managerVO);



}
