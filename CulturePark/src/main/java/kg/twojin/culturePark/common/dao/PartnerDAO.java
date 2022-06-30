package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.PartnerVO;

import java.util.List;

public interface PartnerDAO  {


    List<PartnerVO> getAllPartner();


    // 조회
    PartnerVO selectPartner(PartnerVO partnerVO);

    PartnerVO selectPartner(int seq);

}
