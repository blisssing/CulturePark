$(document).ready(function () {
    // Todo : 활성 - 비활성 토글 적용

    var result="";
    pauseResult="";

    $('input[name=btn_active]').click(function () {
        var eventRow = $(this).closest('tr');
        var mb_seq = eventRow.children('.user_num').val();
        var btn_active = $('input[name=btn_active]');
        var value = btn_active.val();

        if (value === 'active') {
            btn_active.val('inactive');
        } else {
            btn_active.val('active');
        }
        var new_val = btn_active.val();
        console.log(new_val);
        var map = {"mb_seq":mb_seq,"mb_status": new_val};

        $.ajax({
            type:"post",
            dateType:"JSON",
            data:JSON.stringify(map),
            cache:false,
            async:false,
            contentType:'application/json; charset=utf-8',
            traditional:true,
            url:"/changeMbActive.ado",
            success: function (data) {
                console.log('결과 실행');
            }

        });


    });

    $('.btn_modi_info').click(function () {
        clearUserInfo();
        selectedRow = $(this).closest('tr');
        var email = selectedRow.children('.email');
        var phone = selectedRow.children('.phone');
        var name = selectedRow.children('.name');
        var nick = selectedRow.children('.nick');
        var joinDate = selectedRow.children('.joinDate')
        $('#UserEmail').val(email.text());
        $('#UserName').val(name.text());
        $('#UserNick').val(nick.text());
        $('#UserTel').val(phone.text());
        $('#JoinDate').text(joinDate.text());

        modal_now  = $('#UserInfoModal');
        modal_now.modal({});
    });

    //  임시 키 발급
    $('.btn_temp_key').click(function () {
        selectedRow = $(this).closest('tr');
        //Todo :
        modal_now = $('#TempKeyModal');
        modal_now.modal({});
    });

    $('.btn_finalTempKey').click(function () {
        var mb_email = selectedRow.children('.email').text();
        var mb_nick = selectedRow.children('.nick').text();
        var mb_data = {"mb_email": mb_email, "mb_nick":mb_nick};
        console.log('지정된 이메일 : ' + mb_email);

        $.ajax({
            type: "post",
            data: JSON.stringify(mb_data),
            dateType: "JSON",
            traditional:true,
            cache: false,
            async: false,
            contentType: 'application/json; charset=utf-8',
            url: "/getTemporaryKey.ado",
            success: function (data) {
                alert("성공적으로 발급에 성공했습니다.")
            },
            error: function () {
                alert("발급을 실패했습니다!");
            }
    });
        modal_now.modal('hide');
    });

    // 결제 내역 조회

    $('.btn_buy_list').click(function () {
        alert("결제내역 창으로 이동 ");
    });


    // 징계 모달 띄우기
    $('.btn_dicip').click(function () {
        selectedRow = $(this).closest('tr');
        modal_now = $('#DicipModal');
        $('.userEmail').text(selectedRow.children('.email').text());
        modal_now.modal({});
    });

    // 징계 선택
    $('.select_dicip').change(function () {
        var inputBox = $('#DicipReason');
        var selectedCase = $(this).val();

        if (selectedCase === 'direct') {
            $('#DicipReason').val('');
            inputBox.removeAttr('disabled');
        } else {
            selectedCase = $('.select_dicip option:selected').text();
            $('#DicipReason').val(selectedCase);
            inputBox.attr('disabled', true);
        }
    });

    $('.btn_finalDicip').click(function () {
        var mb_seq = selectedRow.children('.user_num').val();
        var reason = $('#DicipReason').val();
        var level = $('#SelectLevel').val();


        var resultSet = {"mb_seq": mb_seq , "pause_reason": reason, "pause_date": level};

        $.ajax({
            url:"/setMemberPause.ado",
            datatype: "json",
            data: JSON.stringify(resultSet),
            contentType:"application/json; charset=utf-8",
            success: function (data) {
                if (result === 'success') {
                    alert("성공했습니다");
                } else {
                    alert("실패했습니다");
                }
            }


        });
    });

    $('.btn_report').click(function () {
        selectedRow = $(this).closest('tr');
        var usercode = selectedRow.children('.user_num').val();
        alert("신고목록창으로 이동 | usercode : "+ usercode);
    });






    // common

    $('.btn_modal_close').click(function () {
        closeModal(modal_now);
    });


    function closeModal(modal) {
        modal.modal('hide');
    }

    // 기입칸 초기화
    function clearUserInfo() {
        $('#UserEmail').val('');
        $('#UserName').val('');
        $('#UserNick').val('');
        $('#UserTel').val('');
        $('#JoinDate').text('');
    }



    function getReport(obj) {

    }



});