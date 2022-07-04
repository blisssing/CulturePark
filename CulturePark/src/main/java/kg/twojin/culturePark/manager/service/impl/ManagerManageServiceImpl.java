package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.ManagerDAO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.manager.service.ManagerManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("managerMangerService")  //참조하는 클래스
public class ManagerManageServiceImpl implements ManagerManageService {

    // 세부 구현 페이지

    @Autowired
    private ManagerDAO managerDAO;

    @Override
    public List getManagerList() {
        List <ManagerVO> managerList = null;
        try {
            managerList = managerDAO.selectAllManagers();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return managerList;
    }

    @Override
    public int insertManager(ManagerVO managerVO) {
        int result =0;
        result = managerDAO.insertManager(managerVO);
        return result;
    }

    @Override
    public int updateManager(ManagerVO managerVO) {
        int result = 0;
        result = managerDAO.updateManager(managerVO);
        /* managerDAO의 updateManager메서드를 (managerVO)의 인자값을 받아서 이동한다 */
        return result;
    }

    /*@Override
    public int deleteManager(ManagerVO managerVO) {
        int result = 0;
        result = managerDAO.deleteManager(managerVO);
        return result;
    }*/

    @Override
    public int deleteManager(int mg_seq) {
        int result = 0;
        result = managerDAO.deleteManager(mg_seq);
        return result;
    }
}
