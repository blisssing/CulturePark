//매니저 수정
$('.btn_update_manager').click(function() {
    eventRow = $(this).closest('tr');
    modal_now = $('#UpdateModal');

/*    var comp_num = eventRow.children('.comp_num');*/
    var name = eventRow.children('.name').text();
    var email = eventRow.children('.email').text();
    var phone = eventRow.children('.phone').text();
    var seq = eventRow.children('.manager_num').val();
    var str_is = eventRow.children('.right').text();

    rebuildIs(str_is);

    $('.mg_seq').val(seq);
    $('#ManagerName').val(name);
    $('#ManagerEmail').val(email);
    $('#ManagerPhone').val(phone);

    modal_now.modal({});
});

$('.update_btn').click(function() {
    alert('수정되었습니다');

    var frm = $('.frm_update_modal');

    frm.attr("action","/mAccountModify.mdo");
    frm.submit();

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

        var frm = $('.frm_delete_modal');

        frm.attr("action","/mAccountDelete.mdo");
        frm.submit();

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

/*function reloadPage() {
    location.reload();
}*/

function rebuildIs(str_is) {
    /* 슬래쉬로 구분돼 있는 문자열을 다시 나눠서 셋팅 하는 방법*/
    if (str_is.indexOf('/')) {
        var str_list = str_is.split('/');
        for (var i = 0; i < str_list.length; i++) {
            var str_item = str_list[i];
            if (str_item === 'chart') {
                $('.chart_input').attr("checked", "checked");
            } else if (str_item === 'pdManage') {
                $('.pdManager_input').attr("checked", "checked");
            } else if (str_item === 'qnaManage') {
                $('.qna_input').attr("checked", "checked");
            } else if (str_item === 'accountManage') {
                $('.account_input').attr("checked", "checked");
            }
        }
    } else {
        if (str_is === 'chart') {
            $('.chart_input').attr("checked", "checked");
        } else if (str_is === 'pdManage') {
            $('.pdManager_input').attr("checked", "checked");
        } else if (str_is === 'qnaManage') {
            $('.qna_input').attr("checked", "checked");
        } else if (str_is === 'accountManage') {
            $('.account_input').attr("checked", "checked");
        }

    }

}
