package kg.twojin.culturePark.manager.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@Component  //빈 객체 만들어줌  - (하위: controller, service, repository)
//repository 빈 저장소 공간
public class ManagerVO {
    String mg_company, mg_name, mg_email, mg_tel, mg_pw, mg_is;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date mg_createDate;
    int mg_seq; //int인 이유는 성공/실패 여부
}
