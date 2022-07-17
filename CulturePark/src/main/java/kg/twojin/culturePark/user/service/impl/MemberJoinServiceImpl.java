package kg.twojin.culturePark.user.service.impl;

import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberJoinService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service("memberJoinService")
public class MemberJoinServiceImpl implements MemberJoinService {

    @Autowired
    MemberDAO memberDAO;



    @Override
    public String searchEmailAddress(String userEmail) {

        String result = memberDAO.selectEmail(userEmail);
        if (result == null) {
            result = "able";
        } else {
            result = "unable";
        }
        return result;
    }
    //진희
    @Override
    public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
        String api_key = "NCSPDPTUNFAJ7XXO";
        String api_secret = "KHCTQUKWVUPP2ROBLIRMNYW5IJMTNBAP";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> set = new HashMap<String, String>();
        set.put("to", userPhoneNumber);
        set.put("from", "01098672292");
        set.put("type", "sms");
        set.put("text", "[Web 발신] CulturePark 인증번호는 : " + "[" + randomNumber + "]" + "입니다");
        set.put("app_version", "ver 0.6");

        try {
            JSONObject result = coolsms.send(set); // 보내기&전송결과받기
            System.out.println(result.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }

    @Override
    public String searchNickname(String userNick) {
        String result= memberDAO.selectNickName(userNick);

        if (result == null) {
            return "able";
        } else {
            return "disalbe";
        }

    }

    @Override
    public int joinMember(MemberVO memberVO) {

        return memberDAO.insertMember(memberVO);
    }

    @Override
    @Transactional
    public MemberVO integrateMember(MemberVO memberVO) {


        int result1 = memberDAO.joinUpdateMember(memberVO);
        int result2 = memberDAO.insertKakaoMember(memberVO.getMb_email());
        MemberVO resultMember = null;
        System.out.println("result1 = " + result1);
        System.out.println("result2 = " + result2);

        if (result1+result2 != 2) {
            resultMember = memberDAO.selectMember(memberVO);
        }

        return resultMember;
    }


}
