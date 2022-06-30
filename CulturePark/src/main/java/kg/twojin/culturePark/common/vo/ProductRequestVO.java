package kg.twojin.culturePark.common.vo;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class ProductRequestVO {

    String
            pdr_title,           // 제목 V
            pdr_genre1,          // 장르1 V
            pdr_genre2,          // 장르2 V
            pdr_timeType,        // 시간타입 V
            pdr_closeDay,        // 휴관요일 V
            pdr_tag,             // 태그 V
            pdr_thumbnail_PATH,  // 썸네일 V
            pdr_descript_PATH,
            pdr_mainImg_PATH,    // 설명파일 V
            pdr_typeStr,         // 티켓유형 문자열 V
            pdr_requestStatus,   // 요청상태 V
            pdr_status,
            pdr_request_manager;

    Date pdr_startDate, pdr_closeDate, pdr_requestDate; //V

    int pdr_seq, pt_seq, pdr_openTime, pdr_closeTime, pdr_maxTicket; //V


}
