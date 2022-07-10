package kg.twojin.culturePark.common.service.impl;

import kg.twojin.culturePark.common.service.RandomNumberUtil;
import org.springframework.stereotype.Service;

@Service("RandomNumberUtil")
public class RandomNumberUtilImpl implements RandomNumberUtil {


    @Override
    public int getRandomCode6() {
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000); // 난수 생성
        return randomNumber;
    }
}
