package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.common.dao.AdminDAO;
import kg.twojin.culturePark.admin.service.AdminManageService;
import kg.twojin.culturePark.common.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminManageService")
public class AdminManageServiceImpl implements AdminManageService {

    @Autowired
    private AdminDAO adminDAO;


    @Override
    public AdminVO loginAdmin(AdminVO adminVO) {
        AdminVO vo = adminDAO.loginAdmin(adminVO);
        return vo;
    }

    @Override
    public List getAdminList() {
        List <AdminVO> adminList = null;
        adminList = adminDAO.listAdmins();
        return adminList;
    }


    // 계정 수정

    @Override
    public int updateAdminWithPw(AdminVO adminVO) {

        int result = adminDAO.updateAdminWithPw(adminVO);
        System.out.println("서비스 결과 값 : " + result);
        return result;
    }

    @Override
    public int updateAdminWithoutPw(AdminVO adminVO) {
        int result = adminDAO.updateAdminWithoutPw(adminVO);
        System.out.println("서비스 결과 값 : " + result);
        return result;
    }

    @Override
    public int insertAdmin(AdminVO adminVO) {
        return adminDAO.insertAdmin(adminVO);
    }

    @Override
    public int removeAdmin(AdminVO adminVO) {
        int result= adminDAO.removeAdmin(adminVO);
        return result;
    }
}
