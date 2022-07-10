
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--https://velog.io/@rudwnd33/TIL-11월-27일--%>
    <title>TEST</title>
</head>
<body>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>



    <input class="pd_thumbnail" name="pd_thumbnail" type="file">
    <input class="upload_btn" type="button" value="전송"/>

</body>

<script>
    $(document).ready(function () {
        $('.upload_btn').click(function () {
            var form = $('.pd_thumbnail')[0].files[0];
            var data = {pd_seq: 1, pd_title:"testTitle"};

            // var form = $('.pd_thumbnail');

            // var data = new Object();
            //
            // data.pd_seq = 1;
            // data.pd_title = "testTitle";

            var formData = new FormData();
            formData.append('file', form);
            formData.append('key', new Blob([JSON.stringify(data)], {type:"application/json"}));
            console.log(form);
            console.log(formData);
            $.ajax({
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                type:"post",
                data: formData,
                url: "/uploadFile.mdo",
                success: function (result) {
                    alert("전송 성공!")
                },
                error: function () {
                    alert("전송 실패!");
                }
            })

        });
    });
</script>
</html>
