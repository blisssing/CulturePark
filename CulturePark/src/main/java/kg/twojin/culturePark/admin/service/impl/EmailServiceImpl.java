package kg.twojin.culturePark.admin.service.impl;


import kg.twojin.culturePark.admin.service.EmailService;
import kg.twojin.culturePark.common.vo.EmailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


import javax.mail.internet.MimeMessage;


@Service("emailService")
public class EmailServiceImpl implements EmailService {

//    https://dlgkstjq623.tistory.com/287 참고
//    https://code-boki.tistory.com/48 참고

    @Autowired
    @Qualifier("naverMailSender")
    JavaMailSender mailSender;

    @Override
    public boolean sendEmail(EmailVO vo) {
        MimeMessage mail = mailSender.createMimeMessage();
        try {
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true, "UTF-8");

            mailHelper.setFrom("taran0913@naver.com", "한진희");
            mailHelper.setTo(vo.getReceiveMail());
            mailHelper.setSubject(vo.getSubject());
            mailHelper.setText(vo.getMessage());
            mailSender.send(mail);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


}
