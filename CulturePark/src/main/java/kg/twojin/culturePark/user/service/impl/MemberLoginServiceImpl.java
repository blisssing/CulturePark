package kg.twojin.culturePark.user.service.impl;

import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import kg.twojin.culturePark.user.service.MemberLoginService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
@Service("memberLoginService")
public class MemberLoginServiceImpl implements MemberLoginService {

    @Autowired
    MemberDAO memberDAO;

    @Override
    public MemberVO memberLogin(MemberVO memberVO) {
        MemberVO vo = memberDAO.selectMember(memberVO);
        return vo;
    }

    @Override
    public MemberVO memberFindId(MemberVO memberVO) {
        MemberVO vo = memberDAO.findId(memberVO);
        return vo;
    }

    @Override
    public MemberVO memberFindPw_Email(MemberVO memberVO) {
        MemberVO vo= memberDAO.findPw_Email(memberVO);
        return vo;
    }

    @Override
    public MemberVO memberFindPw_Phone(MemberVO memberVO) {
        MemberVO vo = memberDAO.findPw_Tel(memberVO);
        return vo;
    }

    @Override
    public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
        /* //진희 coolsms
        String api_key = "NCSPDPTUNFAJ7XXO";
        String api_secret = "KHCTQUKWVUPP2ROBLIRMNYW5IJMTNBAP";*/

        //진아 coolsms
        String api_key = "NCSZXYRTOUI7U2OD";
        String api_secret = "K59D4SJR3PNIDXTECM340LXORZXKI47T";

        
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> set = new HashMap<String, String>();
        set.put("to", userPhoneNumber);
        set.put("from", "01091009406");
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


}
