$(document).ready(function () {



});

//Todo : 코드를 사용해서 DB의 해당 관리자의 모든 정보를 가져옴
function getInfoFromDB(num) {
    var name = obj.children('.name').text();
    var depart = obj.children('.depart').text();
    var email = obj.children('.email').text();

    settingInput(name, depart, email);
}

//Todo : DB에서 값을 가져온 값을 셋팅해주는 동작 넣어주기
function settingInput(name, depart, email) {


    $('#FirstName').val(name);
    $('#InputEmail').val(email);
    $('#Depart').val(depart);

    var box = $(opener.document).getElementsByClassName('selected_row');
    box.removeClass('selected_row');
}


