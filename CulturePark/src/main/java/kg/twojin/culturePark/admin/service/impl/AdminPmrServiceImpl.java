package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.AdminPmrService;
import kg.twojin.culturePark.common.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("adminPmrService")
public class AdminPmrServiceImpl implements AdminPmrService {

    @Autowired
    ProductDAO productDAO;

    @Override
    public Map<String, Object> getPmrInfo(int pmr_seq) {
        return productDAO.selectPmrInfo(pmr_seq);
    }

    @Override //Todo : 동작확인 해줄 것!!
    public int refusePmr(Map<String, Object> map) {
        String status = "거절";
        map.put("pml_status", status);

        return productDAO.updatePmrStatus(map);
    }
}
