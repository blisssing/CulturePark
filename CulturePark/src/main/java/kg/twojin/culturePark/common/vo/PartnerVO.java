package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@ToString
@Data
public class PartnerVO {

        String pt_email, pt_comp_name, pt_ceo_name,
               pt_ceo_number, pt_file, pt_phone;
        int pt_seq;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        Date pt_createDate;
    }




