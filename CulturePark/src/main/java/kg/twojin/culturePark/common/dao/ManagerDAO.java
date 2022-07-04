package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.ManagerVO;

import java.util.List;

public interface ManagerDAO {

    ManagerVO loginManager(ManagerVO managerVO);

    ManagerVO selectManagerByEmailAndPt(ManagerVO managerVO);

    int insertManager(ManagerVO managerVO);

    int insertRootManager(ManagerVO managerVO);

    int updateManager(ManagerVO managerVO);

    /*int deleteManager(ManagerVO managerVO);*/

    int deleteManager(int mg_seq);

    List selectAllManagers();
}
