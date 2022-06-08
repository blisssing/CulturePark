$(document).ready(function () {

    var modal_now;

    // Admin 담당자 불러오기
    $('.btn_ad_info').click(function () {

        eventData = $(this);
        eventRow = $(this).closest('tr');

        var comp_num = eventRow.children('.comp_num');
        getAdminInfo(comp_num);

        $('#AdminInfoModal').modal({});
        modal_now = $('#AdminInfoModal');
    });

    $('.btn_modal_close').click(function () {
        closeModal(modal_now);
    });

    //Todo : 파트너 넘버로 승인 Admin 정보 가져오기
    function getAdminInfo(comp_num) {

    }


    // 매니저 계정 생성하기
        $('.btn_create').click(function () {
            clearValues();
            eventRow = $(this).closest('tr');
            var comp_num = eventRow.children('.comp_num').val();
            var compName = eventRow.children('.comp').text();
            var comp_email = eventRow.children('.email').text();
            var tel = eventRow.children('.phone').text();

            console.log(tel);
            $('#ManagerEmail').val(comp_email);
            $('#ManagerPhone').val(tel);
            $('.head_comp_name').text(compName);
            $('.head_comp_num').text(comp_num);


            modal_now = $('#CreateModal');
            modal_now.modal({});
        });

        $('.btn_createDone').click(function () {
            var comp_num = $('.head_comp_num').text();
            var manager_name = $('#ManagerName').val();
            var manager_email = $('#ManagerEmail').val();
            var manager_tel = $('#ManagerPhone').val();

            var result_values  = chkValues(manager_name, manager_email, manager_tel);

            if (result_values) {
                createManager(comp_num, manager_name, manager_email, manager_tel);
                alert('계정생성 성공!');
                closeModal(modal_now);
                reloadPage();
            } else {

            }

        });

        // 키보드 이벤트

        function chkValues(name, email, tel) {
            if (name.trim() === '' || email.trim() === '' || tel.trim() === '') {
                alert("빈칸이 확인됐습니다. 입력칸을 확인해주세요.");
                return false;
            } else {
                return true;
            }
        }

        // Todo : 매니저 계정을 생성해주는 코드를 구현해주기
        function createManager(comp_num , name, email, tel) {

        }

        function clearValues() {
            $('#ManagerName').val('');
            $('#ManagerEmail').val('');
            $('#ManagerPhone').val('');
        }

    // 파트너 취소

        $('.btn_delete_partner').click(function () {
            eventRow = $(this).closest('tr');
            modal_now = $('#DeleteModal');
            $('#DeleteModal').modal({});
        });

        $('.btn_finalDelete').click(function () {
            var comp_num = eventRow.children('.comp_num');
            var text = $('#decideDelete').val();
            var result_repeat = chkText(text);
            if (result_repeat) {
                $('#decideDelete').val('');
                eventRow.remove();
                closeModal(modal_now);
                alert("성공적으로 파트너를 삭제했습니다");
            } else {
                alert("잘못 입력했습니다. 다시 확인해주세요.")
            }


        });

        // 파트너 삭제 확인 메시지
        function chkText(text) {
            if (text === '파트너를 삭제합니다') {
                return true;
            } else {
                return false;
            }
        }





// Common func

    // 관리자 권환 확인 Todo : 관리자 권한 확인하는 메서드 만들기
    function chkRight(right) {
        if (right === 'super') {
            return true;
        } else {
            return false;
        }
    }



    // 모달 닫기 기능
    function closeModal(modal_now) {
        modal_now.modal('hide');
    }

    function reloadPage() {
        location.reload();
    }


    // Todo:루트 계정 존재 확인
    function chkRoot() {

    }

    //Todo : 임시비밀번호 생성
    function createpw() {

    }






});