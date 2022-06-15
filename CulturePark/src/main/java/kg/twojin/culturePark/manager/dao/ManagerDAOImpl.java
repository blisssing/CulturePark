package kg.twojin.culturePark.manager.dao;

import kg.twojin.culturePark.manager.vo.ManagerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("mangerDAO") //managerDAO 라는 이름으로 spring객체로서 springContext로 띄어짐
public class ManagerDAOImpl implements ManagerDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public ManagerVO loginManager(ManagerVO managerVO) {
        // set,get의 작업없이 한번에 처리하게됨 
        
        ManagerVO vo = null;
        try{
            vo = sqlSessionTemplate.selectOne("mapper.manager.selectAdmin", managerVO);
            //managerVO에 담아져 온 검색값을 vo 변수에 담아준다
        }catch(Exception e) {
            e.printStackTrace();
        }
        return vo;
    }

    @Override
    public int insertManager(ManagerVO managerVO) {
        return sqlSessionTemplate.insert("mapper.manager.insertManager",managerVO);
    }

    @Override
    public List listManagers() {
        List<ManagerVO> managerList = null;
        managerList = sqlSessionTemplate.selectList("mapper.manager.selectAllManager");
        return managerList;
    }
}
