package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.PartnerRequestDAO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("partnerRequestDAOImpl")
public class PartnerRequestDAOImpl implements PartnerRequestDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int insertPartner(PartnerVO partnerVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mapper.partner.insertPartnerRequest", partnerVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public String  getPartnerByEmail(String email){
    //DAO와 가장 근접하기때문에 메소드명 작성시 근접한 뜻으로 만듬

        String result = null;
        try {                                                               //mapper의 id
            result = sqlSessionTemplate.selectOne("mapper.partner.selectExistEmailRequest", email);
        }catch(Exception e) {
            result = null;
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List <PartnerVO> selectAllPartner() {

        List<PartnerVO> partnerVOList = null;
        try {
            partnerVOList = sqlSessionTemplate.selectList("mapper.partner.selectAllPartnerRequest");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return partnerVOList;
    }

    @Transactional
    @Override
    public int agreePartnerRequest(PartnerVO partnerVO) {

        int result1=0;
        int result2=0;
        try {
            result1 = sqlSessionTemplate.update("mapper.partner.updateStatusRequest", partnerVO.getPt_seq());
            result2 = sqlSessionTemplate.insert("mapper.partner.insertPartner", partnerVO);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        if (result1 == 1 && result2 == 1) {
            return 1;
        } else {
            return 0;
        }
    }
}
