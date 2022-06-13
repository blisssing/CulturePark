package kg.twojin.culturePark.service.admin;

import kg.twojin.culturePark.dao.admin.AdminDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public void adminLogin() {

    }

    @Override
    public void adminLogout() {

    }
}
