$(document).ready(function () {


    // 수정 버튼
    $('.btn_modi_info').click(function () {
        var name = $(this).closest('.name').text();
        var depart = $(this).closest('.depart').text();
        var email = $(this).closest('.email').text();
        var num = $(this).closest('.num').text();
        var create_date = $(this).closest('.create_date').text();

        // var infomations = "name="+name+"&&depart="+depart+"&&email="+email+"&&num="+num+"&&create_date="+create_date;

        var url = "adminModi.ado";
        var status = "width=600, height=800, top=0, left=0";
        var title = "modiPage";

        openWin = window.open(url,title, status);

        openWin.document.getElementById("FirstName").val(name);



    });

    // 권한 수정 버튼

    $('.btn_modi_right').click(function () {
        var name = $(this).closest('.name').text();
        var depart = $(this).closest('.depart').text();
        var email = $(this).closest('.email').text();
        var create_date = $(this).closest('.create_date').text();


    });


    // 삭제 버튼
    $('.btn_delete_data').click(function () {
        var name = $(this).closest('.name').text();
        var depart = $(this).closest('.depart').text();
        var email = $(this).closest('.email').text();
        var create_date = $(this).closest('.create_date').text();

        console.log("실행 확인!");
        $(this).closest("tr").remove();
    });

    function sendData(name, depart, email, create_date) {
        //To do: 담아서 DB에 셋팅해주는 코드 만들어줄 것


    }





});