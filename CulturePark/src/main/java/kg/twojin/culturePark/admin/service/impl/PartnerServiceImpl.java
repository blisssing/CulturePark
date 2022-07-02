package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.dao.ManagerDAO;
import kg.twojin.culturePark.common.dao.PartnerDAO;
import kg.twojin.culturePark.common.dao.PartnerRequestDAO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("partnerService")
public class PartnerServiceImpl implements PartnerService {

    @Autowired
    PartnerRequestDAO partnerRequestDAO;

    @Autowired
    PartnerDAO partnerDAO;

    @Autowired
    ManagerDAO managerDAO;

    @Override
    public List<PartnerVO> getAllPartnerRequest() {
        return partnerRequestDAO.selectAllPartner();
    }

    @Override
    public List<PartnerVO> getAllPartner() {
        return partnerDAO.getAllPartner();
    }

    @Transactional
    @Override
    public int agreePartnerRequest(PartnerVO partnerVO, ManagerVO managerVO) {

        int result1 =partnerRequestDAO.agreePartnerRequest(partnerVO);
        int result2 = managerDAO.insertManager(managerVO);

        if (result2 == 1 && result1 == 1) {
            return 1;
        } else {
            return 0;
        }

    }

    @Override
    public ManagerVO createManagerAccount(PartnerVO partnerVO, String encodePw) {

        ManagerVO managerVO = new ManagerVO();

            managerVO.setComp_seq(partnerVO.getPt_seq());
            managerVO.setMg_email(partnerVO.getPt_email());
            managerVO.setMg_pw(encodePw);
            managerVO.setMg_name(partnerVO.getPt_register_name());
            managerVO.setMg_tel(partnerVO.getPt_phone());
            managerVO.setMg_is("root");
            managerVO.setMg_createDate(new Date());
        // Todo : 신청인 자리 만들어줄 것
        return managerVO;
    }

    @Override
    public PartnerVO getPartnerBySeq(int pt_seq) {
        return partnerDAO.selectPartner(pt_seq);
    }
}
