$(document).ready(function () {


    // 업 버튼
    $('.btn_cnt_up').click(function () {
        var nodeParent = $(this).parent();
        var inputContainer = nodeParent.children('.select_cnt_box').children('input');
        var numNow = inputContainer.val();

        if (numNow <= 11) {

            var newVal = parseInt(numNow)+1;
            inputContainer.val(newVal);

            var price_str = nodeParent.parent().children('.case_wrap').children('.price').text();
            var price_int = parseInt(price_str);
            var price_now = getTotal();
            addTotal(price_int, price_now);
        }

        checkInput();

    });

    // 다운 버튼
    $('.btn_cnt_down').click(function () {
        var nodeParent = $(this).parent();
        var inputContainer = nodeParent.children('.select_cnt_box').children('input');
        var numNow = inputContainer.val();

        if (parseInt(numNow) !== 0) {
            var newVal = parseInt(numNow)-1;
            inputContainer.val(newVal);

            var price_str = nodeParent.parent().children('.case_wrap').children('.price').text();
            var price_int = parseInt(price_str);
            var price_now = getTotal();

            minusTotal(price_int, price_now);
        }

        checkInput();

    });

    // 결제하기 버튼

    $('.decide_btn').click(function () {
        if (parseInt($('.decide_btn').val())=== 2) {
            location.href='book04.do';
        }
    });


});


function getTotal () {

    var totalStr = $('.price_mount').text().replace(',','');
    if (totalStr !== '') {
        var totalInt = parseInt(totalStr);
        return totalInt;
    } else {
        return 0;
    }

}

function addTotal(val1, val2) {
    var nVal = val2 + val1;
    $('.price_mount').text(nVal);
}

function minusTotal(newVal, totalVal) {
    var nVal = totalVal - newVal;
    $('.price_mount').text(nVal)
}

function checkInput() {
    var btn_node = $('.decide_btn');

    if (parseInt($('.price_mount').text())===0) {
        btn_node.val(1);
        btn_node.html("구매할 가격의 매수를<br>선택해주세요");
        // $('.msg_choose').css('display','inline-block');
        // $('.msg_goBook').css('display', 'none');

    } else if(parseInt($('.price_mount').text())!==0){
        $('.decide_btn').html("결제하기");
        btn_node.val(2);
        // $('.msg_choose').css('display','none');
        // $('.msg_goBook').css('display', 'inline-block');
    }

}





