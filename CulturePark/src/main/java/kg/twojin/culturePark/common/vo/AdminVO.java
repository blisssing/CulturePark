package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;


import java.util.Date;

@ToString
@Data
@Component
public class AdminVO {
    String ad_email, ad_pw, ad_name, ad_tel, ad_is, ad_depart;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date ad_createDate;
    int ad_seq;
}
