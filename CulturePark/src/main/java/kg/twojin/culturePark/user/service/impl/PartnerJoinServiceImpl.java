package kg.twojin.culturePark.user.service.impl;

import kg.twojin.culturePark.common.dao.PartnerRequestDAO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.user.service.PartnerJoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("partnerJoinService")
public class PartnerJoinServiceImpl implements PartnerJoinService {

    @Autowired
    PartnerRequestDAO partnerDAO;

    @Override
    public int insertPartner(PartnerVO partnerVO) {
        return partnerDAO.insertPartner(partnerVO);
    }

    @Override
    public String chkEmailFromPartner(String email) {
        String result; //변수에 담아준다
        result = partnerDAO.getPartnerByEmail(email);
        return result;
    }


}
