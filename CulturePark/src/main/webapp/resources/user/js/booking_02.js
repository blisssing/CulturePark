$(document).ready(function () {



    $('.btn_section').click(function () {
        if (checkRadio()) {
            location.href = "book03.do";
        } else {
            alert("회차를 먼저 선택해주세요!");
        }
    });

    $('input[name="chk"]').click(function () {
        if (checkRadio()) {
            $('.btn_section').html('다음 단계로 이동');
        } else {
            console.log("거짓!!");
            $('.btn_section').html('회차를 선택해주세요.');
        }
        inputData($(this));
    });


});


function checkRadio() {

    if ($('input[name="chk"]').is(':checked')){
        return true
    } else {
        return false;
    }
}


function inputData(obj) {
    var radio_node = obj;
    var data_row = radio_node.parent().parent();
    var round_number = data_row.children('.round_r_data').children('.round_number').text();
    var round_time = data_row.children('.round_time').text();

    $('.time_round').text(round_number);
    $('.unit').text('회');
    $('.round_time_info').text(round_time);


    console.log(round_time);
}

