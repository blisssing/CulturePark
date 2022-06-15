package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.manager.dao.ManagerDAO;
import kg.twojin.culturePark.manager.vo.ManagerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("managerMangerService")  //참조하는 클래스
public class ManagerManageServiceImpl implements ManagerManageService {

    // 세부 구현 페이지


    @Autowired
    private ManagerDAO managerDAO;

    @Override
    public ManagerVO loginManager(ManagerVO managerVO) {
        ManagerVO vo = managerDAO.loginManager(managerVO);
        return vo;
    }

    @Override
    public List getManagerList() {
        List <ManagerVO> managerList = null;
        managerList = managerDAO.listManagers();
        return managerList;
    }

    @Override
    public int insertManager(ManagerVO managerVO) {
        return managerDAO.insertManager(managerVO);
    }

    @Override
    public int removeManager(ManagerVO managerVO) {
        return 1;
    }
}
