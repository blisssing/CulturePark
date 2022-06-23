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

    frm.attr("action","/mAccountModifyProc.mdo");
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
    var manager_num = eventRow.children('.manager_num').val();
    var text = $('#decideDelete').val();
    var result_repeat = chkText(text);
    
    var insertResult="";
    
    if (result_repeat) {
        $('#decideDelete').val(''); //초기화
        console.log('수행 확인 구간 1 ');
        /*var frm = eventRow.children('.row_frm');*/
        /*
        frm.attr("action","/mAccountDeleteProc.mdo");
        frm.submit(); */

        deleteUsingAjax(manager_num);
                        // mg_seq는 manager_num에서 받아옴

        if (insertResult === 'success') {
            alert("삭제를 성공했습니다.");
            eventRow.remove();
            closeModal(modal_now);
        } else {
            alert("삭제를 실패했습니다.");
        }
        
        /*
        eventRow.remove();
        closeModal(modal_now);
        alert("성공적으로 매니저를 삭제했습니다");*/


    } else {
        alert("잘못 입력했습니다. 다시 확인해주세요.")
    }


    function deleteUsingAjax(mg_seq) {
        $.ajax({
            type:"post",
            datatype:"text",
            url:"/mAccountDeleteProc.mdo",
            async:false,
            cache:false,
            data: {"mg_seq" : mg_seq}, //key값:value값
            success:function(result) {
                insertResult = result;
            }

        });
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
