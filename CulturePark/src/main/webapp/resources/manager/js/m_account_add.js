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
    $('#ManagerPhone').val(parseInt(tel));
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
