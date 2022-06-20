package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.Ad_UserListService;
import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

@Service("Ad_UserListService")
public class Ad_UserListServiceImpl implements Ad_UserListService {

    @Autowired
    MemberDAO memberDAO;

    @Override
    public List<MemberVO> getMemberList() {
        return memberDAO.selectAllMember();
    }

    @Override
    public int updateMemberActive(MemberVO memberVO) {
        return memberDAO.updateMemberActive(memberVO);
    }


    @Override
    public int modifyMemberPassword(int mb_seq, String pw) {
        return 0;
    }
}