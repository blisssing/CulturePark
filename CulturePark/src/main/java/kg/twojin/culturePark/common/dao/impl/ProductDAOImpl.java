package kg.twojin.culturePark.common.dao.impl;

import kg.twojin.culturePark.common.dao.ProductDAO;
import kg.twojin.culturePark.common.vo.DateTicketInfoVO;
import kg.twojin.culturePark.common.vo.ProductRequestVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import kg.twojin.culturePark.common.vo.StageTicketInfoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();

    // 상품 요청 조회

    @Override
    public List selectAllNewProduct() {
        List<ProductVO> productVOList = null;
        try {
            productVOList = sqlSessionTemplate.selectList("mapper.productRequest.selectAllNewProduct");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productVOList;
    }

    @Override
    public List selectAllOnwPdCreateRequest(int pt_num) {
        List<ProductRequestVO> productRequestVOList = null;
        System.out.println(pt_num);

        try {
            productRequestVOList = sqlSessionTemplate.selectList("mapper.productRequest.selectProductRequestByPtSeq", pt_num);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("오류확인");
        }

        return productRequestVOList;
    }


    // 상품 조회
    @Override
    public List selectAllExhibitProductByPtSeq(int pt_seq) {
        List<ProductVO> productVOList = null;
        try {
            productVOList = sqlSessionTemplate.selectList("mapper.productInfo.selectAllExhibitProductList", pt_seq);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return productVOList;
    }

    @Override
    public List selectAllMuseumProductByPtSeq(int pt_seq) {
        List<ProductVO> productVOList = null;
        try {
            productVOList = sqlSessionTemplate.selectList("mapper.productInfo.selectAllMuseumProductList", pt_seq);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return productVOList;
    }

    @Override
    public int insertProductRequest(ProductVO productVO) {
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mapper.productRequest.insertProduct", productVO);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    @Transactional
    public int insertNewProduct(int pdr_seq) {
        ProductRequestVO productRequestVO = null;
        Exception exception; // 테스트 할 때 일부러 오류를 발생시키기 위한 .

        int result1 = 0;
        int result2 = 0;
        int result3 = 0;
        int pd_seq = 0;
        int finalResult = 0;

        // 1단계 : pdr 정보를 통해 요청 정보 전체를 productRequestVO에 담기
            productRequestVO = sqlSessionTemplate.selectOne("mapper.productRequest.selectProductRequestBySeq", pdr_seq);
        System.out.println("1단계 결과 : " + productRequestVO.toString() );

        // 2단계 : 모든 정보가 담겨져 있는 productRequestVO를 ProductInfo 테이블에 담아주기 < == 허용된 상품만 등록됨
        if (productRequestVO != null) {
                result1 = sqlSessionTemplate.insert("mapper.productInfo.insertProduct", productRequestVO);
        } else {
            return -1;
        }

        // 3단계 : 티켓 유형을 바탕으로 판매정보 테이블을 생성

        ProductVO newProductVo = null;
        String pdr_timeType = productRequestVO.getPdr_timeType();

        // 3- 1: 정식 등록된 pd의 정보를 얻어오기 위해 product Info 조회

        if (result1 == 1) { //
                newProductVo = sqlSessionTemplate.selectOne("mapper.productInfo.selectProductByPtAndTitle", productRequestVO);
        }

        //조회를 통해 얻어온 pd_seq 주입
        pd_seq = newProductVo.getPd_seq();

        // 3 -2  티켓 유형에 따른 생성
        if (pd_seq <=0  ) {
            // 실패
        } else{



            // 휴관 요일 확인하기 : productRequestVO에 담겨져 있는 데이터를 바탕으로 휴관요일을 확인 -> 멤버변수로 쓰기 위해 if 바깥에
            String[] closeDayAry = productRequestVO.getPdr_closeDay().split("/");

            boolean sun = chkCloseDay(closeDayAry, "sun");
            boolean mon = chkCloseDay(closeDayAry, "mon");
            boolean tue = chkCloseDay(closeDayAry, "tue");
            boolean wed = chkCloseDay(closeDayAry, "wed");
            boolean thu = chkCloseDay(closeDayAry, "thu");
            boolean fri = chkCloseDay(closeDayAry, "fri");
            boolean sat = chkCloseDay(closeDayAry, "sat");
                                                                                                            //            if (pdr_timeType.equals("day")) {
            // productRequestVO의 데이터를 바탕으로 오픈 - 마감 기간을 선정. 그리고 countDate의 시작지점을
            // startDate로 지정.

            Date startDate = productRequestVO.getPdr_startDate();
            Date closeDate = productRequestVO.getPdr_closeDate();
            Date countDate = startDate;

            // 날짜 확인
            System.out.println(startDate.toString());
            System.out.println(closeDate.toString());
            System.out.println(countDate.toString());


            //closeDate이 countDate보다 크다면(이후라면) 1을 반환
            int compare = closeDate.compareTo(countDate);
            System.out.println("비교 결과 : " + compare);

            // closeDate이 countDate보다 크거나 같을 때까지 while 반복
            while (compare >= 0) {

                // 날짜계산하기 위해 cal을 countDate으로 설정
                cal.setTime(countDate);

                // 휴관하는 날짜에 해당하는지 확인하기
                // Calendar.DAY.OF_WEEK : 요일을 인덱스로 알려줌 0 : 일요일 , 1 : 월요일
                int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

                // countDate에 해당하는 요일과 휴관 요일이 같은지 확인
                if (dayOfWeek == 0 && sun || dayOfWeek == 1 && mon || dayOfWeek == 2 && tue
                        || dayOfWeek == 3 && wed || dayOfWeek == 4 && thu || dayOfWeek == 5 && fri
                        || dayOfWeek == 6 && sat) {

                    // 만약 해당 요일에 대한 boolean 값이 true 일 경우 휴관이므로 DB에 넣을 필요가 없음.
                    // countDate를 1일 증가시켜줌.

                    cal.add(Calendar.DATE, 1);
                    String newDateString = df.format(cal.getTime());

                    try {
                        countDate = new Date(df.parse(newDateString).getTime());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                    // 만약 compare의 값이 1로 나오지 않을 경우 while문 탈출,  1이면 다시 반복.
                    compare = closeDate.compareTo(countDate);

                    continue; // 반복문 탈출구 앞으로.
                }


                if (pdr_timeType.equals("day")) {

                    // productRequestVO를 바탕으로 날짜별 티켓유형 vo 생성
                    DateTicketInfoVO dateTicketInfoVO = changeToDateTicketTypeVO(productRequestVO);
                    dateTicketInfoVO.setPd_seq(pd_seq);

                    // 값이 제대로 주입돼 있는지 1차 확인
                    System.out.println(" 내용 1차 확인 : " + dateTicketInfoVO.toString());

                    // 날짜 vo에 담아주기
                    dateTicketInfoVO.setDti_date(countDate);
                    System.out.println(dateTicketInfoVO.toString());

                    try {
                        result3 = sqlSessionTemplate.insert("mapper.dateTicket.insertTicketInfo", dateTicketInfoVO);
                    } catch (Exception e) {
                        e.printStackTrace();
                        break;
                    }
                } else {

                    System.out.println("실행지점 확인 : time");

                    StageTicketInfoVO stageTicketInfoVO;
                    stageTicketInfoVO = changeToStageTicketTypeVO(productRequestVO);
                    stageTicketInfoVO.setSti_date(countDate);

                    // DB에 기입하기 전에 맵에 담아주기

                    Map <String ,String > stageTimeMap = stageTicketInfoVO.getStageTimeMap();
                    List<String> stageTimeList = stageTicketInfoVO.getStageTimeList();
                    Map<String, Object> stageMap = new HashMap<String, Object>();

                    stageMap.put("stageVO", stageTicketInfoVO);
                    stageMap.put("stageTimeList", stageTimeList);
//
//                    stageMap.put("stageTimeMap", stageTimeMap);

                    try {
                        result3 = sqlSessionTemplate.insert("mapper.stageTicket.insertTicketInfo", stageMap);
                    } catch (Exception e) {
                        e.printStackTrace();
                        throw e;
                    }
                }

                System.out.println("Step Final : " + result3);
                    // 날짜에 +1 연산
                    cal.add(Calendar.DATE, 1);
                    String newDateString = df.format(cal.getTime());
                    System.out.println("동작확인 1 : " + df.format(cal.getTime()));

                    // countDate에 반환
                    try {
                        countDate = new Date(df.parse(newDateString).getTime());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    System.out.println("동작 확인 2 : ");

                    System.out.println("종료날짜" + df.format(closeDate));
                    System.out.println("카운트 날짜" + df.format(countDate));

                    compare = closeDate.compareTo(countDate);

                    System.out.println("비교결과 : " + compare);
                } // result3 =1 <<= 정상
                System.out.println("while 탈출 확인 ");
            }

            System.out.println("최종 수행 결과 : " + result3);

            return result3;
        }

    @Override // 온 오프 전환
    public int updateProductStatus(ProductVO productVO) {
        return sqlSessionTemplate.update("mapper.productInfo.updateProductStatus", productVO);
    }

    @Override
    public int insertProductModiRequest(ProductVO productVO, int mg_seq) {

        HashMap<String, Object> map = new HashMap<>();
        map.put("mg_seq", mg_seq);
        map.put("productVO", productVO);

        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.productInfo.insertProductModiRequest", map);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        return result;
    }

    @Override
    public int updateProductRequestStatusAgree(int pdr_seq) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.productRequest.updateRequestStatusAgree", pdr_seq);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int updateProductRequestStatusRefused(int pdr_seq) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mapper.productRequest.updateRequestStatusRefused", pdr_seq);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return result;
    }

    private boolean chkCloseDay(String [] closeDayStr, String day) {

            int closeDayAryLength = closeDayStr.length;

            for (int i = 0; i < closeDayAryLength; i++) {

                String indexStr = closeDayStr[i];

                if (indexStr.equals("sun") && day.equals("sun") || indexStr.equals("mon") && day.equals("mon") ||
                        indexStr.equals("tue") && day.equals("tue") || indexStr.equals("wed") && day.equals("wed") ||
                        indexStr.equals("thu") && day.equals("thu") || indexStr.equals("fri") && day.equals("fri") ||
                        indexStr.equals("sat") && day.equals("sat")) {
                    return true;
                }
            }

            return false;
        }

    private DateTicketInfoVO changeToDateTicketTypeVO(ProductRequestVO productRequestVO) {

        DateTicketInfoVO dateTicketInfoVO = new DateTicketInfoVO();
        dateTicketInfoVO.setPt_seq(productRequestVO.getPt_seq());
        dateTicketInfoVO.setDti_ticketMax(productRequestVO.getPdr_maxTicket());
        dateTicketInfoVO.setDti_ticketNow(productRequestVO.getPdr_maxTicket());

        return dateTicketInfoVO;
    }

    private StageTicketInfoVO changeToStageTicketTypeVO(ProductRequestVO productRequestVO) {

        StageTicketInfoVO stageTicketInfoVO = new StageTicketInfoVO();
        stageTicketInfoVO.setPt_seq(productRequestVO.getPt_seq());
        stageTicketInfoVO.setSti_ticketMax(productRequestVO.getPdr_maxTicket());

        int openTime = productRequestVO.getPdr_openTime();
        int closeTime = productRequestVO.getPdr_closeTime();

        Map<String, String> stageTimeMap = new HashMap<String, String>();
        List<String> stageTimeList = new ArrayList<>();
        for (int i = openTime; i <= closeTime; i++) {
            String tempStr = "sti_stage_";
            tempStr += (i+1);
            stageTimeMap.put(tempStr, tempStr);
            stageTimeList.add(tempStr);
            System.out.println(tempStr);
        }

        stageTicketInfoVO.setStageTimeList(stageTimeList);
        stageTicketInfoVO.setStageTimeMap(stageTimeMap);
        return stageTicketInfoVO;
    }


}
