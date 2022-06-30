package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class ProductVO {
    String
            pd_title,           // 제목 V
            pd_genre1,          // 장르1 V
            pd_wgenre2,          // 장르2 V
            pd_timeType,        // 시간타입 V
            pd_closeDay,        // 휴관요일 V
            pd_tag,             // 태그 V
            pd_thumbnail_PATH,  // 썸네일 V
            pd_descript_PATH,
            pd_mainImg_PATH,    // 설명파일 V
            pd_typeStr,         // 티켓유형 문자열 V
            pd_requestStatus,   // 요청상태 V
            pd_status,
            pd_request_manager;

    Date pd_startDate, pd_closeDate, pd_requestDate; //V

    int pd_seq, pt_seq, pd_openTime, pd_closeTime, pd_maxTicket; //V



    //17

}
