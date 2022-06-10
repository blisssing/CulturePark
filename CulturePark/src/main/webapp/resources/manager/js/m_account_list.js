//매니저 수정
$('.btn_update_manager').click(function() {
    eventRow = $(this).closest('tr');
    modal_now = $('#UpdateModal');

    var comp_num = eventRow.children('.comp_num');
    var name = eventRow.children('.name').text();
    var email = eventRow.children('.email').text();
    var phone = eventRow.children('.phone').text();

    $('#ManagerName').val(name);
    $('#ManagerEmail').val(email);
    $('#ManagerPhone').val(phone);

    modal_now.modal({});
});

$('.update_btn').click(function() {
    alert('수정되었습니다');
    reloadPage();
});

$('.btn_modal_close').click(function () {
    closeModal(modal_now);
});



//매니저 삭제
$('.btn_delete_manager').click(function () {
    eventRow = $(this).closest('tr');
    modal_now = $('#DeleteModal');
    modal_now.modal({});
});

$('.btn_finalDelete').click(function () {
    var comp_num = eventRow.children('.comp_num');
    var manager_num = eventRow.children('.manager_num');
    var text = $('#decideDelete').val();
    var result_repeat = chkText(text);
    if (result_repeat) {
        $('#decideDelete').val(''); //초기화
        eventRow.remove();
        closeModal(modal_now);
        alert("성공적으로 매니저를 삭제했습니다");
        reloadPage();
    } else {
        alert("잘못 입력했습니다. 다시 확인해주세요.")
    }
});


// 매니저 삭제 확인 메시지
function chkText(text) {
    if (text === '매니저를 삭제합니다') {
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
