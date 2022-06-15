$(document).ready(function () {


    // 수정 버튼
    $('.btn_modi_info').click(function () {

        eventData = $(this); // 버튼 이벤트가 발생한 지역
        eventRow = $(this).closest('tr'); // 버튼 이벤트가 발생한 행

        var name = eventRow.children('.name').text();
        var depart = eventRow.children('.depart').text();
        var email = eventRow.children('.email').text();
        var num = eventRow.children('.num').text();
        var tel = eventRow.children('.tel').val();
        var is = eventRow.children('.is').val();
        var date = eventRow.children('.create_date').val();

        //Todo : 데이터를 담아서 권한 체크박스와 전화번호 칸에 셋팅 해줄 것.
        setModal(name, email,depart,tel,is); //Todo : 인자값으로 전화번호를 추가해줄 것

        // 모달 창 띄우기
        $('#modifyModal').modal({});
    });

    // 모달창 수정완료 버튼
    $('.btn_modiDone').click(function ()    {
        var name = $('#AdminName').val();
        var email = $('#InputEmail').val();
        var phone = $('#InputPhone').val();
        var pw1 = $('#InputPassword').val();
        var pw2 = $('#RepeatPassword').val();
        var depart = $('#Depart').val();
        var chk_right = $('input[name=chk_right]:checked');


        var chk_result = chk_values(name,email,phone,pw1,pw2,depart,chk_right);


        if (chk_result === 1) { // 확인 결과 값이 정상적으로 기입돼 있지만, 비번 변경은 없을 경우
            console.log('정상 실행 : 1 ');
            insertWithoutPw(name,email,phone,depart,chk_right);
        } else if (chk_result===2) { // 비번 변경이 있을 경우
            console.log('정상실행 : 2 ');
            insertWithPw(name,email,phone, pw1, depart,chk_right);
        } else if (chk_result===0) { // 확인 결과 값이 정상적으로 기입돼 있지 않다면
            console.log('비정상적 실행');
            return;
        } else {
            console.log("코드가 비 정상적으로 수행 됨");
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

        function chk_values(name, email, phone, pw1, pw2, depart, chk_right) {

            // return 0 : 조건 불충족
            // return 1 : 비밀번호 제외 수정값 DB에 적용
            // return 2 : 비밀번호 포함 수정값 DB에 적용

            // 비밀번호를 제외한 모든 빈칸 확인
            if (name.trim() === '' || email.trim()==='' || phone.trim()===''
                || depart.trim()==='' ) {
                alert("비어있는 칸이 있습니다. 내용을 확인해주세요.");
                return 0;
            } else if (chk_right.length === 0) {
                alert("권한을 최소 한 개 이상 설정해야 합니다");
                return 0;
            } else if (pw1.trim() === '' && pw2.trim() !== '' || pw1.trim() !== '' && pw2.trim() === '') {
                // 비밀번호 입력칸 2 개중 어느 하나라도 값이 들어가 있으면
                alert("비밀번호를 변경한다면 두 칸 모두 채워줘야 합니다.");
                return 0;
            } else {

                if (pw1.trim() === '' && pw2.trim() === '') {
                    // 비밀번호를 제외한 정보 수정
                    return 1;
                } else if (pw1.trim() !== '' && pw2.trim() === '') {
                    // 재입력이 빈칸 일 경우
                    // 오류!!!!
                    alert("재입력칸이 비어있습니다. 다시 입력해주세요");
                    return 0;
                } else if (pw2.trim() === '' && pw1.trim()!=='') {
                    // 1차 입력칸이 비어있을 경우
                    alert("비밀번호 1차 입력이 비어있습니다. 다시 확인해주세요.")
                    return 0;
                } else if (pw1 !== pw2) {
                    // 1차와 2차 입력이 불일치할 경우
                    alert("1차 비밀번호와 재확인 비밀번호가 일치하지 않습니다. 다시 확인해주세요");
                    return 0;
                } else if (pw1 === pw2) {
                    var result_chkPW = chkPW(pw1);
                    if (result_chkPW===1) {
                        console.log('정규식 통과');
                        return 2;
                    } else {
                        if (result_chkPW === -1) {
                            alert("8자리 ~ 20자리 이내로 입력해주세요");
                        } else if (result_chkPW === -2) {
                            alert('비밀번호는 공백없이 입력해주세요!');
                        } else if (result_chkPW === -3) {
                            alert("영문 숫자, 특수문자를 혼합하여 입력해주세요.");
                        }
                        console.log('정규식 불통');



                        return 0;
                    }
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
        name = $(this).closest('.name').text();
        depart = $(this).closest('.depart').text();
        email = $(this).closest('.email').text();
        create_date = $(this).closest('.create_date').text();
        selectedRow = $(this).closest("tr");
        selectedFrm = $(this).closest('.frm');
        $('#deleteModal').modal({});
    });

    $('.btn_finalDelete').click(function () {

        var text = $('#decideDelete').val();

        if (text.trim() === '관리자를 삭제합니다') {
            selectedRow.remove();
            frm.attr("action","/deleteAdminProc.ado");
            frm.submit();
            return true;
        } else {
            alert("다시 입력해주세요!")
            return false;
        }


    });

    // 모달에 데이터 셋팅
    //Todo : 인자값으로 전화번호를 추가해줄 것
    function setModal(name, email,depart,tel,is) {
        $('#AdminName').text(name);
        $('#InputEmail').text(email);
        $('#Depart').val(depart);
        $('#InputPhone').val(tel);

        var isList = is.split('/');

        for (var isRight in isList) {

            console.log(isRight);
            if (isRight === 'member') {
                $('#chk_member').prop('checked', true);
            } else if (isRight === 'manager') {
                $('#chk_manager').prop('checked', true);
            } else if (isRight === 'product') {
                $('#chk_product').prop('checked', true);
            } else if (isRight === 'super') {
                $('#chk_super').prop('checked', true);
            }

        }

    }

    // 수정한 내용 DB에 넣기
    function insertWithPw(name, email, phone, pw1, depart, chk_right) {
    // Todo : DB에 값을 넣어주는 코드를 만들어줄 것

    }

    // 수정한 내용 DB에 넣기
    function insertWithoutPw(name,email,phone,depart,chk_right) {
    // Todo : DB에 값을 넣어주는 코드를 만들어줄 것

    }

    function deleteAdmin(name) {
        //Todo : 관리자 정보를 삭제해주는 코드를 만들어줄 것
    }




});