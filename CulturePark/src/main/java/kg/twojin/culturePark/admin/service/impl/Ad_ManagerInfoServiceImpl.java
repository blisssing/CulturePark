package kg.twojin.culturePark.admin.service.impl;


import kg.twojin.culturePark.admin.service.Ad_ManagerInfoService;
import kg.twojin.culturePark.common.dao.ManagerDAO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ad_ManagerInfoService")
public class Ad_ManagerInfoServiceImpl implements Ad_ManagerInfoService {

    @Autowired
    ManagerDAO managerDAO;

    @Override
    public ManagerVO getManagerInfoByEmailAndPt(ManagerVO managerVO) {
        return managerDAO.selectManagerByEmailAndPt(managerVO);
    }
}
