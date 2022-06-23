package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.PartnerVO;

import java.util.List;

public interface Partner_RequestService {
    List<PartnerVO> getAllPartnerRequest();

    int agreePartnerRequest(PartnerVO partnerVO);

}
