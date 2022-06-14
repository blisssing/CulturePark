package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.admin.vo.AdminVO;

import java.util.List;

public interface AdminManageService {

    void adminLogin(AdminVO adminVO);

    List selectAllAdmins();

    int insertAdmin(AdminVO adminVO);

    int removeAdmin(AdminVO adminVO);



}
