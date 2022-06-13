package kg.twojin.culturePark.dao.admin;

import kg.twojin.culturePark.vo.admin.AdminVO;


public interface AdminDAO {

    AdminVO loginAdmin(AdminVO adminVO);

    int createAdmin(AdminVO adminVO);




}
