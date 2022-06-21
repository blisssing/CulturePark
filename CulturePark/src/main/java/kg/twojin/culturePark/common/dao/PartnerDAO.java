package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.PartnerVO;

public interface PartnerDAO {

    int insertPartner(PartnerVO partnerVO);

    String  getPartnerByEmail(String email);

}
