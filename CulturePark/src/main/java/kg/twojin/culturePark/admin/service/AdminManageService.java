package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.admin.vo.AdminVO;

import java.util.List;

public interface AdminManageService {

    AdminVO adminLogin(AdminVO adminVO);



    List adminList();

    int insertAdmin(AdminVO adminVO);

    int removeAdmin(AdminVO adminVO);



}
