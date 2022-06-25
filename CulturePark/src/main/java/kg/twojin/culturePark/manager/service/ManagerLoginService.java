package kg.twojin.culturePark.manager.service;

import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;

public interface ManagerLoginService {

    ManagerVO loginByManager(ManagerVO managerVO);
    PartnerVO loginByPartner(PartnerVO partnerVO);

}
