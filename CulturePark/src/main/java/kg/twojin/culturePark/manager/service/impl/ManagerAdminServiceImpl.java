package kg.twojin.culturePark.manager.service.impl;

import kg.twojin.culturePark.common.dao.AdPdRelationDAO;
import kg.twojin.culturePark.common.dao.AdminDAO;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.manager.service.ManagerAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("managerAdminService")
public class ManagerAdminServiceImpl implements ManagerAdminService {

    @Autowired
    AdPdRelationDAO adPdRelationDAO;

    @Autowired
    AdminDAO adminDAO;

    @Override
    public List getAdminListByPdSeq(int pd_seq) {
        List aprList = adPdRelationDAO.selectAdminByPdSeq(pd_seq);
        List<AdminVO> adminVOList = null;
        if (aprList != null) {
             adminVOList=adminDAO.selectAdminInfoByMultiSeq(aprList);
        }

        return adminVOList;
    }
}
