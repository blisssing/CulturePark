package kg.twojin.culturePark.user.service;

import kg.twojin.culturePark.common.dao.MemberDAO;
import kg.twojin.culturePark.common.vo.MemberVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service("memberJoinService")
public class MemberJoinServiceImpl implements MemberJoinService{

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

    public void certifiedTelNumber(String userTelNumber, int randomNumber) {
        String api_key = "NCSZXYRTOUI7U2OD";
        String api_secret = "K59D4SJR3PNIDXTECM340LXORZXKI47T";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", "01091009406"); //수신전화번호
        params.put("from", "01091009406"); //발신전화번호
        params.put("type", "SMS");
        params.put("text", "[TEST]인증번호는" + "[" + randomNumber + "]" + "입니다.");
        params.put("app_version", "test app 1.2");

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }

    /*@Override
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

    }*/

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
        return 0;
    }

}
