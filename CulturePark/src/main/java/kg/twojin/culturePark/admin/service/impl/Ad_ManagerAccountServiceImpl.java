package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.Ad_ManagerAccountService;

import kg.twojin.culturePark.common.dao.ManagerDAO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.CompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ad_managerAccountService")
public class Ad_ManagerAccountServiceImpl implements Ad_ManagerAccountService {

    @Autowired
    ManagerDAO managerDAO;

    @Override
    public List<ManagerVO> getManagerList() {
        return managerDAO.selectAllManagers();
    }

    @Override
    public CompanyVO getCompanyInfo(int comp_seq) {
        return null;
    }

    @Override
    public int deleteManager(ManagerVO managerVO) {
        return 0;
    }

    @Override
    public ManagerVO getManagerInfoByEmail(String mg_email) {
        return managerDAO.selectManagerByEmail(mg_email);
    }
}
