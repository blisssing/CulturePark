package kg.twojin.culturePark.manager.dao;

import kg.twojin.culturePark.manager.vo.ManagerVO;

import java.util.List;

public interface ManagerDAO {

    ManagerVO loginManager(ManagerVO managerVO);

    int insertManager(ManagerVO managerVO);

    List listManagers();
}
