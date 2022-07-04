$(document).ready(function () {

    $('.btn_comp_info').click(function () {
        clearValuesCompany();
        selectedRow = $(this).closest('tr');

        var comp_num = selectedRow.children('.comp_num').val();
        var pt_compName;
        var pt_ceoName;
        var pt_ceoNumber;
        var pt_tel;
        var pt_email;
        var pt_agreeDate;
        var pt_file;


        $.ajax({
            type:"POST",
            dataType:"text",
            data:{"comp_num":comp_num},
            url:"mgInfoModal.ado",
            async:false,
            cache:false,
            success: function(data) {
                var jsonInfo = JSON.parse(data);


                comp_num = jsonInfo.pt_seq;
                pt_compName = jsonInfo.pt_comp_name;
                pt_ceoName = jsonInfo.pt_ceo_name;
                pt_ceoNumber = jsonInfo.pt_ceo_number;
                pt_tel = jsonInfo.pt_phone;
                pt_email = jsonInfo.pt_email;
                pt_agreeDate = jsonInfo.pt_agreeDate;
                pt_file = jsonInfo.pt_file;

                $('#CompanySeq').text(comp_num);
                $('#CompanyName').text(pt_compName);
                $('#PresentName').text(pt_ceoName);
                $('#CompanyNum').text(pt_ceoNumber);
                $('#PhoneNumber').text(pt_tel);
                $('#CompanyEmail').text(pt_email);
                $('#AgreementDate').text(pt_agreeDate);
                $('#File_location').text(pt_file);
            },
            error: function() {
                console.log("실패!");
            },
        });

        $('#CompanyInfoModal').modal({});
    });


     /*   var getInfo_result = getInfoComp(comp_num);*/

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



    return true;
}

/*
function getInfoManager(comp_num, manager_num) {
    //Todo : 회사 넘버와 매니저 넘버를 통해 회사 정보를 DB에서 불러오는 코드를 작성해줄 것
    return true;
}
*/


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