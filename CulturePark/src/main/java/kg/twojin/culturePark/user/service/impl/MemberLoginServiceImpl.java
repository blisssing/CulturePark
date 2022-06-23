package kg.twojin.culturePark.user.service.impl;

import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberLoginService")
public class MemberLoginServiceImpl implements MemberLoginService {

    @Autowired
    MemberDAO memberDAO;

    @Override
    public MemberVO login(MemberVO memberVO) {
       MemberVO vo = memberDAO.login(memberVO);
        return vo;
    }

}
