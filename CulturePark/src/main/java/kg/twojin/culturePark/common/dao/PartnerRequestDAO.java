package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.PartnerVO;

import java.util.List;

public interface PartnerRequestDAO {

    int insertPartner(PartnerVO partnerVO);

    List selectAllPartner();

    String  getPartnerByEmail(String email);

    int agreePartnerRequest(PartnerVO partnerVO);

}
