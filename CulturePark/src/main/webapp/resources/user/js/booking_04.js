$(document).ready(function () {


    // 이니시스 결제를 위한 화면 크기 조정
    window.resizeTo(1000, 800);

    $('.check_module').click(function () {

        var IMP = window.IMP;
        IMP.init("imp09517431")
        IMP.request_pay({
            pg:"inicis",
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            /*
            *   merchant_uid의 경우 https://docs.iamport.kr/implementation/payment
            *   에서 넣을 수 잇는 방법을 알려줌
            * */
            name: '주문명:결제테스트', // 결제창에서 보여질 이름
            amount: 1000, // 가격
            buyer_email: 'imaport@siot.do',
            buyer_nmae:'구매자이름',
            buyer_addr:'구매자 주소',
            buyer_postcode:'123-456',
            m_redirect_url: 'localhost:8080/bookDone.do' // 모바일 결제 후 이동하는 페이지
            /*
            *  모바일 결제시, 결제가 끝나고 랜딩되는 URL을 지정. 카카오페이, vpdlzh, ekskfdml ruddnsms vlfdy djqtdma
            *  pc와 마찬가지로 callback함수로 결과가 번환됨
            *
            * */
        }, function(rsp){
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID ' + rsp.imp_uid;
                msg += '상점거래ID ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_name;
                location.href='bookDone.do'; // 성공시 페이지 이동
            } else {
                var msg = '결제에 실패했습니다.';
                msg += '에러 내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });

    });
});