package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@ToString
public class DateTicketInfoVO {

        /*
        PT_SEQ INTEGER NOT NULL ,
        PD_SEQ INTEGER NOT NULL ,
        DTI_DATE timestamp NOT NULL ,
        DTI_TICKET_MAX INTEGER NOT NULL ,
        DTI_TICKET_NOW INTEGER NOT NULL CHECK( DTI_TICKET_NOW>0 ),
        DTI_TICKET_SAVE INTEGER DEFAULT 0,
        CONSTRAINT DATE_TICKET_INFO_PK PRIMARY KEY (PD_SEQ, DTI_DATE) -- 복합키*/

    int pt_seq, pd_seq, dti_ticketMax, dti_ticketNow, dti_ticketSave;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date dti_date;








}
