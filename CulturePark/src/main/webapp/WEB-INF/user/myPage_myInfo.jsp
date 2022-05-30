<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style>
        <%@include file="/resources/common/css/reset.css" %>
    </style>
    <style>
        <%@include file="/resources/common/css/common.css" %>
    </style>
    <style>
        <%@include file="/resources/user/css/common_header.css" %>
    </style>
    <style>
        <%@include file="/resources/user/css/common_footer.css" %>
    </style>
    <style>
        <%@include file="/resources/user/css/common_side.css" %>
    </style>
    <style>
        <%@include file="/resources/user/css/myPage.css" %>
    </style>
    <style>
        <%@include file="/resources/user/css/myPage_subMenu.css" %>
    </style>
    <style>
      <%@include file="/resources/user/css/myPage_myInfo.css"%>
    </style>

    <%-- script --%>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

    <title>myPage</title>

</head>
<body>

<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
    <%-- haader --%>
    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp" %>
    </div>

    <%-- center --%>
    <div class="centerContainer">
        <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
        <%-- 이곳에 페이지를 import --%>
        <%--index--%>

        <%-- 내부 영역을 한 번 감싸주는 영역.  --%>

        <div class="innerContainer">
            <div class="innerContainer">

                <div class="subMenu_container">
                    <%@ include file="/WEB-INF/user/myPage_subMenu.jsp" %>
                </div>

                <div class="content_container">
                  <div class="firstGate_section">
                    <div class="notice_wrap">
                      <div class="notice_icon"><i class="fa-solid fa-lock"></i></div>
                      <div class="notice_text">정보를 안전하게 보호하기 위해 <br> 비밀번호를 다시 한 번 확인합니다</div>
                    </div>


                    <table class="input_table">
                        <tbody>
                      <tr class="id_wrap">
                        <td class="input_head">이메일</td>
                        <td class="input_wrap">UserEMail@twojin.com</td>
                      </tr>
                      <tr class="pw_wrap">
                        <td class="input_head">비밀번호</td>
                        <td class="input_wrap">
                          <input type="password" name="input_pw">
                        </td>
                      </tr>
                        <tr>
                            <td colspan="2">
                                <div class="btn_wrap">
                                    <div class="cancel_btn"><button>취소</button></div>
                                    <div class="check_btn"><button>확인</button></div>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>




                  </div>

                  <div class="secondGate_section"></div>

                </div>
                <%-- /content_container --%>

            </div>
            <%-- /innerContent --%>
        </div>
        <%-- /centerContainer --%>
    </div>
</div>
    <%-- /mainContainer --%>

    <div class="footer_container">
        <%@ include file="/WEB-INF/user/main_footer.jsp" %>
    </div>

</body>

<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="/resources/common/js/common.js" type="text/javascript"></script>
<script src="/resources/user/js/myPage_myInfo.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
</html>