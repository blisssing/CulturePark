package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;
import java.util.Date;

@ToString
@Data
public class PartnerVO {

        String pt_email, pt_pw, pt_comp_name, pt_ceo_name,
               pt_ceo_number, pt_file, pt_phone, pt_phone_code;
        int pt_seq;
        Date pt_createDate;


    }




