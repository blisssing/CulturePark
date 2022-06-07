$(document).ready(function () {

    $('.btn_comp_info').click(function () {
        clearValuesCompany();
        selectedRow = $(this).closest('tr');

        var comp_num = selectedRow.children('.comp_num');
        var getInfo_result = getInfoComp(comp_num);

        if (getInfo_result) {
            $('#CompanyName').text("회사정보불러옴");
        } else {
            alert('화사정보를 성공적으로 불러오지 못했습니다');
            return;
        }
        modal_now = $('#CompanyInfoModal');
        modal_now.modal({});
    });

    $('.btn_mg_info').click(function () {
        clearValuesManager();
        selectedRow = $(this).closest('tr');
        var comp_num = selectedRow.children('.comp_num');
        var manager_num = selectedRow.children('.manager_num');

        var getInfo_result = getInfoManager(comp_num, manager_num);
        if (getInfo_result) {
            $('.head_comp_name').text('업체명이름자리');
        } else {
            alert("매니저 정보를 성공적으로 불러오지 못했습니다.");
            return;
        }
        modal_now = $('#ManagerInfoModal').modal({});
    });

    $('.btn_delete_manager').click(function () {
        console.log('수행확인');
        selectedRow = $(this).closest('tr');
        selectedRow.remove();
    });

    // 토글 온 오프
    $('.switch input').click(function () {
        var this_switch = $(this);
        var this_row = this_switch.parent().parent();
        this_row.children('.toggle_p').toggle();
    });
    //
    // var check = $("input[type='checkbox']");
    // check.click(function(){
    //     $("p").toggle();
    // });


    // common

    $('.btn_modal_close').click(function () {
        modal_now.modal('hide');
    });

});


function getInfoComp(comp_num) {
    //Todo : 회사 넘버를 통해 회사 정보를 DB에서 불러오는 코드를 작성해줄 것
    return true;
}

function getInfoManager(comp_num, manager_num) {
    //Todo : 회사 넘버와 매니저 넘버를 통해 회사 정보를 DB에서 불러오는 코드를 작성해줄 것
    return true;
}


function clearValuesCompany() {
    $('#CompanySeq').text('');
    $('#CompanyName').text('');
    $('#PresentName').text('');
    $('#CompanyNum').text('');
    $('#PhoneNumber').text('');
    $('#CompanyEmail').text('');
    $('#ProductType').text('');
    $('#AgreementDate').text('');


}


function clearValuesManager() {

}