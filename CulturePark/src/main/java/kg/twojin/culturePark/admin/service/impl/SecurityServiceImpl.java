package kg.twojin.culturePark.admin.service.impl;

import kg.twojin.culturePark.admin.service.SecurityService;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Date;

@Service("securityService")
public class SecurityServiceImpl implements SecurityService {


    @Override
    public String  createTempKeyBySec() {


        char[] charSet = new char[]{
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&'
        };
        String str = "";
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int index = 0;
        int len = charSet.length;

        for (int i = 0; i < 10; i++) {
            index = sr.nextInt(len);
            str += charSet[index];
        }


        return str;
    }
}
