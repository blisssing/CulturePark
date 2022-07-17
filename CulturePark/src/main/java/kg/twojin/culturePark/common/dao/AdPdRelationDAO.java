package kg.twojin.culturePark.common.dao;

import java.util.List;
import java.util.Map;

public interface AdPdRelationDAO {

    List selectAdminByPdSeq(int pd_seq);


    int insertStatusLog(Map<String, Object> logMap);
}
