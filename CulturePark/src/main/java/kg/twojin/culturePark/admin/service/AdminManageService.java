package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.admin.vo.AdminVO;

import java.util.List;

public interface AdminManageService {

    AdminVO loginAdmin(AdminVO adminVO);

    List getAdminList();

    int insertAdmin(AdminVO adminVO);

    int removeAdmin(AdminVO adminVO);



}
