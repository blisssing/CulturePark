package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.Ad_UserListService;
import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    public int modifyMemberPassword(String  mb_email, String pw) {
       return  memberDAO.updateMemberPasswordUsingEmail(mb_email, pw);
    }

    @Override
    public int updateMemberPause(int mb_seq, String  date) {

        Calendar cal = Calendar.getInstance();

        if (date.equals("infinity")) { // 영구정지

        } else {
            cal.setTime(new Date());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            cal.add(Calendar.DATE, Integer.parseInt(date));
            df.format(cal.getTime()).toString();
        }

        return 0;
    }

}
