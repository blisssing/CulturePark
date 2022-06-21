package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class EmailVO {

    private String senderName, senderMail, receiveMail,subject, message;

    public EmailVO(String receiveMail, String subject, String message) {
        this.receiveMail = receiveMail;
        this.subject = subject;
        this.message = message;
    }
}
