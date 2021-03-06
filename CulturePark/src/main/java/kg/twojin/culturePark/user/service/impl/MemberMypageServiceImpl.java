package kg.twojin.culturePark.user.service.impl;

import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberMypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberMypageService")
public class MemberMypageServiceImpl implements MemberMypageService {

    @Autowired
    MemberDAO memberDAO;

    @Override
    public int modifyInfo(MemberVO memberVO) {
        return memberDAO.updateMemberWithoutPw(memberVO);
    }
}
