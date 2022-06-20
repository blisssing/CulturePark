package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.common.vo.ManagerVO;

import java.util.List;

public interface ManagerManageService {

    ManagerVO loginManager(ManagerVO managerVO);

    List getManagerList();

    int insertManager(ManagerVO managerVO);

    int updateManager(ManagerVO managerVO);

    /*int deleteManager(ManagerVO managerVO);*/
    int deleteManager(int mg_seq);

}
