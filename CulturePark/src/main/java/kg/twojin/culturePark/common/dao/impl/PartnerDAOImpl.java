package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.PartnerDAO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("partnerDAO")
public class PartnerDAOImpl implements PartnerDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int insertPartner(PartnerVO partnerVO) {
        return 0;
    }

    @Override
    public String  getPartnerByEmail(String email){
    //DAO와 가장 근접하기때문에 메소드명 작성시 근접한 뜻으로 만듬

        String result = null;
        try {                                                               //mapper의 id
            result = sqlSessionTemplate.selectOne("mapper.partner.selectExistEmail", email);
        }catch(Exception e) {
            result = null;
            e.printStackTrace();
        }
        return result;
    }

}
