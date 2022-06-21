package kg.twojin.culturePark.user.service;

import kg.twojin.culturePark.common.vo.PartnerVO;

public interface PartnerJoinService {

    int joinPartner(PartnerVO partnerVO);

    String  chkEmailFromPartner(String  email);



}
