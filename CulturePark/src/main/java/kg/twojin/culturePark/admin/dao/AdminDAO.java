package kg.twojin.culturePark.admin.dao;

import kg.twojin.culturePark.admin.vo.AdminVO;

import java.util.List;


public interface AdminDAO {

    AdminVO loginAdmin(AdminVO adminVO);

    int insertAdmin(AdminVO adminVO);

    List listAdmins();

    // 암호화

//    public void userSignUp(String username, String password, char enable);
//
//    public void giveAuth(String username, String authority);


}
