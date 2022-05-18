
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>likeList delete popup</title>

    <style>

        .content {
            margin-top: 25px;
            text-align:center;
        }

        .btn_section {
            text-align: center;
            margin-top: 30px;
        }

        .list_btn_no {
            width: 70px;
            margin-right: 45px;
        }

        .list_btn_yes {
            width: 70px;
        }
    </style>
</head>
<body>

<div id="popup" class="modal">
    <div class="content">
        정말 삭제하시겠습니까?

        <div class="btn_section">
            <button  id="btn_no" class="list_btn_no" onclick="window.close();">No</button>
            <button id="btn_yes" class="list_btn_yes">Yes</button>
        </div>
    </div>
</div>

</body>

<%-- script --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/myPage_likeList.js"></script>

</html>
