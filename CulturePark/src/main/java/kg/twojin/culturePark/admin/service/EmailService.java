package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.EmailVO;

public interface EmailService {

    public boolean sendEmail(EmailVO vo);

}
