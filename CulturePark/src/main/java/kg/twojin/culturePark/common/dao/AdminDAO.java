package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.AdminVO;

import java.util.List;


public interface AdminDAO {

    /* AdminVO로 반환   반환값이없으면 void */
    AdminVO loginAdmin(AdminVO adminVO);
    /* 인자값을 받아서 관리자 로그인 */

    AdminVO selectAdminEmailTel(int ad_seq);

    /* 관리자 목록*/
    AdminVO selectAdminInfo(int seq);

    /* int로 반환 */
    int insertAdmin(AdminVO adminVO);
    /* 인자값을 받아서 관리자 생성 */

    /* list로 반환 */
    List listAdmins();

    List selectAdminInfoByMultiSeq(List list);

    int removeAdmin(AdminVO adminVO);

    int updateAdminWithPw(AdminVO adminVO);

    int updateAdminWithoutPw(AdminVO adminVO);


    // 암호화

//    public void userSignUp(String username, String password, char enable);
//
//    public void giveAuth(String username, String authority);


}
