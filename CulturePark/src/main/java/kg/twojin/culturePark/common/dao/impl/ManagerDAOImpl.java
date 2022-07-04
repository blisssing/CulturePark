package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.ManagerDAO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("managerDAO") //managerDAO 라는 이름으로 spring객체로서 springContext로 띄어짐
public class ManagerDAOImpl implements ManagerDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public ManagerVO loginManager(ManagerVO managerVO) {
        // set,get의 작업없이 한번에 처리하게됨 
        
        ManagerVO vo = null;
        try{
            vo = sqlSessionTemplate.selectOne("mapper.manager.selectManager", managerVO);
            //managerVO에 담아져 온 검색값을 vo 변수에 담아준다
        }catch(Exception e) {
            e.printStackTrace();
            throw e;
        }
        return vo;
    }

    @Override
    public int insertManager(ManagerVO managerVO) {
        int result = 0;

        try {
            result = sqlSessionTemplate.insert("mapper.manager.insertManager", managerVO);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return result;
    }

    @Override
    public int insertRootManager(ManagerVO managerVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mapper.manager.insertRootManager", managerVO);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return result;
    }

    @Override
    public int updateManager(ManagerVO managerVO) {  /* managerVO 의 인자값을 받은 updateManager메소드의 기능 */
        int result = 0;
        try {                             /*  mapper에 정의 되어있는 기능을 찾아간다. managerVO의 값을 넘긴다*/
            result = sqlSessionTemplate.update("mapper.manager.updateManager", managerVO);
        }catch(Exception e) {                  /* manager-mapper.xml에서 지정해 준 namespace : mapper.manager */
            e.printStackTrace();
            throw e;
        }
        return result;
    }

/*    public int deleteManager(ManagerVO managerVO){
        int result = 0;
        try {
            result = sqlSessionTemplate.delete("mapper.manager.deleteManager", managerVO);
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }*/
    public int deleteManager(int mg_seq){
        int result = 0;
        try {
            result = sqlSessionTemplate.delete("mapper.manager.deleteManager", mg_seq);
        }catch(Exception e){
            e.printStackTrace();
            throw e;
        }
        return result;
    }


    @Override
    public List selectAllManagers() {
         List <ManagerVO> managerList = null;
        try {
            managerList = sqlSessionTemplate.selectList("mapper.manager.selectAllManager");
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return managerList;
    }

    @Override
    public ManagerVO selectManagerByEmailAndPt(ManagerVO managerVO) {
        ManagerVO vo = new ManagerVO();
        try {
            vo = sqlSessionTemplate.selectOne("mapper.manager.selectManagerByEamilAndPt", managerVO);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return  vo;
    }
}
