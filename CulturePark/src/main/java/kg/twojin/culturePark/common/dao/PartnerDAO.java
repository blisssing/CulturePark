package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.PartnerVO;

import java.util.List;

public interface PartnerDAO  {


    List<PartnerVO> getAllPartner();

    PartnerVO selectPartner(PartnerVO partnerVO);

}
