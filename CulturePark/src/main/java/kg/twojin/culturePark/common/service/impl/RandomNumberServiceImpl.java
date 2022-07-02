package kg.twojin.culturePark.common.service.impl;

import kg.twojin.culturePark.common.service.RandomNumberService;
import org.springframework.stereotype.Service;

@Service("RandomNumberService")
public class RandomNumberServiceImpl implements RandomNumberService {


    @Override
    public int getRandomCode6() {
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000); // 난수 생성
        return randomNumber;
    }
}
