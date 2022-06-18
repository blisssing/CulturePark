package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.manager.vo.ManagerVO;

import java.util.List;

public interface ManagerManageService {

    ManagerVO loginManager(ManagerVO managerVO);

    List getManagerList();

    int insertManager(ManagerVO managerVO);

    int updateManager(ManagerVO managerVO);

    int removeManager(ManagerVO managerVO);

}
