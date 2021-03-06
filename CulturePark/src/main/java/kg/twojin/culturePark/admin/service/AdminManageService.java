package kg.twojin.culturePark.admin.service;

import kg.twojin.culturePark.common.vo.AdminVO;

import java.util.List;

public interface AdminManageService {

    AdminVO loginAdmin(AdminVO adminVO);

    List getAdminList();

    int insertAdmin(AdminVO adminVO);

    int updateAdminWithPw(AdminVO adminVO);

    int updateAdminWithoutPw(AdminVO adminVO);

    int removeAdmin(AdminVO adminVO);

    AdminVO getAdminInfo(int seq);



}
