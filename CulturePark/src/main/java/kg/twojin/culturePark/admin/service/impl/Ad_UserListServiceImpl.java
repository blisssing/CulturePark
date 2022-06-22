package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.Ad_UserListService;
import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.common.vo.PauseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public int updateMemberPause(int mb_seq, String  date, String reason) {

        Calendar cal = Calendar.getInstance();
        String dateResult;
        if (!date.equals("inf")) { // 영구정지
            cal.setTime(new Date());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            cal.add(Calendar.DATE, Integer.parseInt(date));
            dateResult = df.format(cal.getTime());
        } else {
            dateResult = "inf";
        }

        MemberVO memberVO = new MemberVO();

        System.out.println("회원번호 : "+mb_seq );
        System.out.println("기한 : " + dateResult);

        memberVO.setMb_seq(mb_seq);
        memberVO.setMb_pauseDate(dateResult);

        PauseVO pauseVO = new PauseVO();

        pauseVO.setMb_seq(mb_seq);
        pauseVO.setPause_reason(reason);
        pauseVO.setPause_period(dateResult);

        int result = memberDAO.updateMemberPausePeriod(memberVO, pauseVO);


        return result;
    }

}
