package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
@ToString
public class StageTicketInfoVO {

    int pt_seq,pd_seq, sti_openTime, sti_closeTime, sti_ticketMax, sti_ticketTotal;

//    sti_stage_1, sti_stage_2,sti_stage_3,sti_stage_4,sti_stage_5,sti_stage_6,sti_stage_7,sti_stage_8,sti_stage_9,sti_stage_10,
//    sti_stage_11,sti_stage_12,sti_stage_13,sti_stage_14,sti_stage_15,sti_stage_16,sti_stage_17,sti_stage_18,sti_stage_19, sti_stage_20,
//    sti_stage_21,sti_stage_22,sti_stage_23, sti_stage_24;


    Map <String ,String > stageTimeMap;
    List stageTimeList;

    Date sti_date;
}
