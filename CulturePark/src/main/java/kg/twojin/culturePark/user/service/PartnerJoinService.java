package kg.twojin.culturePark.user.service;

import kg.twojin.culturePark.common.vo.PartnerVO;

import java.util.List;

public interface PartnerJoinService {

    int insertPartner(PartnerVO partnerVO);

    String  chkEmailFromPartner(String  email);




}
