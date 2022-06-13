package kg.twojin.culturePark.vo.admin;

import lombok.Data;
import org.springframework.stereotype.Component;


import java.util.Date;

@Component("adminVO")
@Data
public class AdminVO {

    String ad_email, ad_pw, ad_name, ad_tel, ad_is;
    Date ad_createDate;
    int ad_code;

}
