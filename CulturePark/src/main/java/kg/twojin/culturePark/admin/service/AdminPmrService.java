package kg.twojin.culturePark.admin.service;

import java.util.Map;

public interface AdminPmrService {

    Map<String, Object> getPmrInfo(int pmr_seq);

    int refusePmr(Map<String, Object> map);
}
