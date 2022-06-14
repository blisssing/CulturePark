package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.admin.dao.AdminDAO;
import kg.twojin.culturePark.admin.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminManageService")
public class AdminManageServiceImpl implements AdminManageService{

    @Autowired
    private AdminDAO adminDAO;


    @Override
    public void adminLogin(AdminVO adminVO) {

    }

    @Override
    public List selectAllAdmins() {
        List adminList = null;
        adminList = adminDAO.listAdmins();
        return adminList;
    }

    @Override
    public int insertAdmin(AdminVO adminVO) {
        return adminDAO.insertAdmin(adminVO);
    }

    @Override
    public int removeAdmin(AdminVO adminVO) {
        return 1;
    }
}
