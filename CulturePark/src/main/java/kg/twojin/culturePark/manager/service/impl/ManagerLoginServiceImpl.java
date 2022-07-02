package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.ManagerDAO;
import kg.twojin.culturePark.common.dao.PartnerDAO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.manager.service.ManagerLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("managerLoginService")
public class ManagerLoginServiceImpl implements ManagerLoginService {


    @Autowired
    PartnerDAO partnerDAO;

    @Autowired
    ManagerDAO managerDAO;

    @Override
    public ManagerVO loginManager(ManagerVO managerVO) {
        return managerDAO.loginManager(managerVO);
    }


}
