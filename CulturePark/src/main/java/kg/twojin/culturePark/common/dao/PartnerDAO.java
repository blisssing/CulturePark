package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.PartnerVO;

import java.util.List;

public interface PartnerDAO  {


    List<PartnerVO> getAllPartner();

    List<PartnerVO> getAllPartnerByPtSeq(int pt_seq);

    // 조회
    PartnerVO getEmailPartner(PartnerVO partnerVO);


    PartnerVO selectPartner(int seq);


}
