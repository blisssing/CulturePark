package kg.twojin.culturePark.admin.dao;

import kg.twojin.culturePark.admin.vo.AdminVO;

import java.util.List;


public interface AdminDAO {

    AdminVO loginAdmin(AdminVO adminVO);

    int insertAdmin(AdminVO adminVO);

    List listAdmins();

}
