$(document).ready(function () {

    // 수정 버튼
    $('.btn_modi_info').click(function () {

        eventData = $(this); // 버튼 이벤트가 발생한 지역
        eventRow = $(this).closest('tr'); // 버튼 이벤트가 발생한 행


        var name = eventRow.children('.name').text();
        var depart = eventRow.children('.depart').text();
        var email = eventRow.children('.email').text();
        var seq = eventRow.children('.seq').val();
        var tel = eventRow.children('.tel').val();
        var is = eventRow.children('.is').val();
        var date = eventRow.children('.create_date').val();

        //Todo : 데이터를 담아서 권한 체크박스와 전화번호 칸에 셋팅 해줄 것.
        setModal(seq, name, email,depart,tel,is); //Todo : 인자값으로 전화번호를 추가해줄 것

        // 모달 창 띄우기
        $('#modifyModal').modal({});
    });

    // 모달창 수정완료 버튼
    $('.btn_modiDone').click(function ()    {
        var phone = $('#InputPhone').val();
        var pw1 = $('#InputPassword').val();
        var pw2 = $('#RepeatPassword').val();
        var depart = $('#Depart').val();
        var chk_right = $('input[name=check_is]:checked');
        var chk_result = chk_values(phone,pw1,pw2,depart,chk_right);

        var eventfrm = $('.modal_frm');

        if (chk_result) {
            eventfrm.attr("action", "/updateAdminProc.ado");
            eventfrm.submit();
            alert("수정이 완료됐습니다!")
        } else { // 확인 결과 값이 정상적으로 기입돼 있지 않다면
            console.log('비정상적 실행');
            return;
        }
    });

    $('#chk_super').change(function () {
        if ($('#chk_super').prop("checked")) {
            $('.chk_normal').attr('disabled', 'disabled');
            $('.chk_normal').prop('checked', false);
        } else {
            $('.chk_normal').prop('disabled', false);
        }
    });

        function chk_values(phone, pw1, pw2, depart, chk_right) {

            // 비밀번호를 제외한 모든 빈칸 확인
            if ( phone.trim()==='' || depart.trim()==='' ) {
                alert("비어있는 칸이 있습니다. 내용을 확인해주세요.");
                return false;
            } else if (chk_right.length === 0) {
                alert("권한을 최소 한 개 이상 설정해야 합니다");
                return false;
            } else if (pw1.trim() === '' && pw2.trim() !== '' || pw1.trim() !== '' && pw2.trim() === '') {
                // 비밀번호 입력칸 2 개중 어느 하나라도 값이 들어가 있으면
                alert("비밀번호를 변경한다면 두 칸 모두 채워줘야 합니다.");
                return false;
            } else {
                if (pw1.trim() !== '') {
                    var result_chk = chkPW(pw1);

                    if (result_chk === -1) {
                        alert("비밀번호는 8자 이상 20자 미만 입력해주세요.");
                        return false;
                    } else if (result_chk === -2) {
                        alert("비밀번호에는 공백이 들어갈 수 없습니다");
                        return false;
                    } else if (result_chk === -3) {
                        alert("비밀번호는 영어, 특수문자, 숫자를 최소 1회씩 기입해주세요.");
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return 2;
                }



            }
        }


    // 모달창 슈퍼권한 선택 이벤트

    $('#right_super').click(function () {
        if ($('input[name=chk_right]:checked').length !== 0) {
            $('.chk_right').prop('checked', false);
        }
    });

    $('.chk_right').click(function () {
        if ($('input[name=chk_right_super]').prop('checked')) {
            $('input[name=chk_right_super]').attr('checked', true);
        }

    });


    // 모달 창 Cancel

    $('.btn_close_modal').click(function () {
        $('#modifyModal').modal('hide');
    });



    // 삭제 버튼

    $('.btn_delete_data').click(function () {
        eventRow = $(this).closest('tr'); // 버튼 이벤트가 발생한 행
        name = $(this).closest('.name').text();
        depart = $(this).closest('.depart').text();
        email = $(this).closest('.email').text();
        create_date = $(this).closest('.create_date').text();
        selectedFrm = eventRow.children('.frm');
        $('#deleteModal').modal({});
    });

    $('.btn_finalDelete').click(function () {

        var text = $('#decideDelete').val();
        if (text.trim() === '관리자를 삭제합니다') {
            console.log(selectedFrm);
            selectedFrm.attr("action", "/deleteAdminProc.ado");
            selectedFrm.submit();
            alert("삭제 성공!");
        } else {
            alert("다시 입력해주세요!")
        }


    });

    // 모달에 데이터 셋팅
    function setModal(seq,name, email,depart,tel,is) {
        $('.modal_ad_seq').val(seq);
        $('#AdminName').text(name);
        $('.modal_ad_name').val(name)
        $('#InputEmail').text(email);
        $('.modal_ad_email').val(email);
        $('#Depart').val(depart);
        $('#InputPhone').val(tel);

        var isList = is.split('/');

        $.each(isList, function (index, item) {
            if (item === 'member') {
                $('#chk_member').prop('checked', true);
            } else if (item === 'manager') {
                $('#chk_manager').prop('checked', true);
            } else if (item === 'product') {
                $('#chk_product').prop('checked', true);
            } else if (item === 'super') {
                $('#chk_super').prop('checked', true);
            }

        });

    }






});