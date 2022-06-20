package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@ToString
@Data
public class MemberVO {
    String mb_email, mb_pw, mb_nick, mb_name, mb_birth,
            mb_gender, mb_tel, mb_status;
    int mb_seq;
    Date mb_createDate;
}