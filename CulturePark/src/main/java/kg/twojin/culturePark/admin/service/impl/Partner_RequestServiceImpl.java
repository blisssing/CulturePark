package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.Partner_RequestService;
import kg.twojin.culturePark.common.dao.PartnerRequestDAO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("partner_RequestService")
public class Partner_RequestServiceImpl implements Partner_RequestService {

    @Autowired
    PartnerRequestDAO partnerRequestDAO;


    @Override
    public List<PartnerVO> getAllPartnerRequest() {
        return partnerRequestDAO.selectAllPartner();
    }

    @Override
    public int agreePartnerRequest(PartnerVO partnerVO) {
        int result  =partnerRequestDAO.agreePartnerRequest(partnerVO);
        return result;
    }
}
