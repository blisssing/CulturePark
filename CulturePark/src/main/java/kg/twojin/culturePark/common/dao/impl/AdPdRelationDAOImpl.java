package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.AdPdRelationDAO;
import kg.twojin.culturePark.common.vo.AdminProductRelationVO;
import kg.twojin.culturePark.common.vo.AdminVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("adPdRelationDAOImpl")
public class AdPdRelationDAOImpl implements AdPdRelationDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List <AdminProductRelationVO> selectAdminByPdSeq(int pd_seq) {

        List<AdminProductRelationVO> aprList = null;

        try {
            aprList = sqlSessionTemplate.selectList("mapper.adPdRelation.selectAdminListByPdSeq", pd_seq);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return aprList;
    }

    @Override
    public int insertStatusLog(Map<String, Object> logMap)  {

        int result = 0;

        try {
            result = sqlSessionTemplate.insert("mapper.adPdRelation.insertActiveLog", logMap);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return result;
    }
}
