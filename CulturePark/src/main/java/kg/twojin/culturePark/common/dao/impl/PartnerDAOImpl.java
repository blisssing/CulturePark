package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.PartnerDAO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("partnerDAO")
public class PartnerDAOImpl implements PartnerDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public PartnerVO getEmailPartner(PartnerVO partnerVO) {
        PartnerVO vo = null;
        try {
            sqlSessionTemplate.selectOne("mapper.partner.selectPartnerByEmail", partnerVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vo;
    }
    @Override
    public List<PartnerVO> getAllPartner() {
        List<PartnerVO> partnerVOList = null;
        try {
            partnerVOList= sqlSessionTemplate.selectList("mapper.partner.selectAllPartner");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
        return partnerVOList;
    }

    @Override
    public PartnerVO selectPartner(int seq) {
        PartnerVO partnerVO = null;
        try {
            partnerVO = sqlSessionTemplate.selectOne("mapper.partner.selectPartnerBySeq", seq);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return partnerVO;
    }


}
