$(document).ready(function(){


    $('.change_btn').click(function(){
        if($('.new_pw_value').val().trim() === ''){
            alert('새비밀번호를 입력해주세요.')
            $('.new_pw_value').focus();

        }else if($('.new_pw_check_value').val().trim() === ''){
            alert('새비밀번호를 확인해주세요.')
            $('.new_pw_check_value').focus();

        }else if($('.new_pw_value').val() !== ($('.new_pw_check_value').val())) {
            alert('비밀번호가 일치하지 않습니다.')

        }else{
            alert("비밀번호가 변경되었습니다.");
            location.href='/home.mdo';
        }
    })

    $('.cancel_btn').click(function(){
            location.href='/home.mdo';
    })






})