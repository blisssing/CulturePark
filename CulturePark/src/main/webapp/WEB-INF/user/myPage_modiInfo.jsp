<%@ page import="kg.twojin.culturePark.common.vo.MemberVO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <%
        String login_Chk_ = (String) session.getAttribute("loginChk");

        if (login_Chk_ == null) {
    %>

    <script> location.href="/login.do"</script>

    <%
        }
    %>



</head>
<body>

<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
    <%-- haader --%>
    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp" %>
        <%@ include file="/WEB-INF/user/main_side.jsp"%>
    </div>

    <%-- center --%>
    <div class="centerContainer">
        <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
        <%-- 이곳에 페이지를 import --%>
        <%--index--%>

        <%-- 내부 영역을 한 번 감싸주는 영역.  --%>

        <div class="innerContainer">

            <div class="subMenu_container">
                <%@ include file="/WEB-INF/user/myPage_subMenu.jsp" %>
            </div>

            <div class="content_container" id="content">
                <div class="secondGate_section">
                    <table class="info_table">
                        <input type="hidden" id="mb_seq" value="${sessionScope.member.mb_seq}"/>
                        <c:set var="mail" value="${sessionScope.member.mb_email}" />
                        <c:set var="nick" value="${sessionScope.member.mb_nick}" />
                        <c:set var="name" value="${sessionScope.member.mb_name}" />
                        <c:set var="birth" value="${sessionScope.member.mb_birth}" />
                        <c:set var="gender" value="${sessionScope.member.mb_gender}" />
                        <c:set var="phone" value="${sessionScope.member.mb_tel}" />
                    <tbody>
                    <tr class="info_row id_row">
                        <td class="info_head">아이디</td>
                        <td class="info_content" name="mb_email">
                            ${mail}
                        </td>
                    </tr>
                    <tr class="info_row nickname_row">
                        <td class="info_head">닉네임</td>
                        <td class="info_content">
                            <div><input type="text" id="input_nick" name="mb_nick" value=${nick}></div>

                        </td>
                    </tr>
                    <tr class="info_row pw_row">
                        <td class="info_head">비밀번호</td>
                        <td class="info_content pw_content">
                            <div><input type="password" id="input_pw" name="mb_pw"></div>
                            <div class="alert_text_01">비밀번호를 변경하지 않을 경우 빈칸으로 남겨주세요</div>
                        </td>
                    </tr>
                    <tr class="info_row sc_pw_row">
                        <td class="info_head">2차 비밀번호</td>
                        <td class="info_content pw_content">
                            <div><input type="password" id="input_sc_pw" name="mb_rePw"></div>
                            <div class="alert_text_02">서로 다른 비밀번호 입니다. 다시 입력해주세요 </div>
                        </td>
                    </tr>

                    <tr class="info_row name_row">
                        <td class="info_head">이름</td>
                        <td class="info_content" name="mb_name">
                            ${name}
                        </td>
                    </tr>
                    <tr class="info_row birth_row">
                        <td class="info_head">생년월일</td>
                        <td class="info_content">
                            <input type="hidden" name="mb_birth" value="${birth}"/>
                            <div class="content_text birth" id="member_year">1996</div>-
                            <div class="content_text birth" id="member_month">09</div>-
                            <div class="content_text birth" id="member_day">21</div>
                        </td>
                    </tr>
                    <tr class="info_row gender_row">
                        <td class="info_head">성별</td>
                        <td class="info_content">
                            <c:choose>
                                <c:when test="${gender=='male'}">
                                <input type="radio" id="chk_male" value="male" name="chk_gender" checked="checked" > 남
                                <input type="radio" id="chk_female" value="female" name="chk_gender"> 여
                                </c:when>
                                <c:otherwise>
                                <input type="radio" id="chk_male" value="male" name="chk_gender" > 남
                                <input type="radio" id="chk_female" value="female" name="chk_gender" checked="checked" > 여
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>

                    <tr class="info_row ph_row">
                        <c:set var="phoneList" value="${fn:split(phone,'-')}"/>

                        <td class="info_head">전화번호</td>
                        <td class="info_content">
                            <c:choose>
                                <c:when test="${phoneList[i] eq '010'}">
                                    <script>
                                        $('.ph_01').prop('selected', true);
                                    </script>
                                </c:when>
                                <c:when test="${phoneList[i] eq '011'}">
                                    <script>
                                        $('.ph_02').prop('selected', true);
                                    </script>
                                </c:when>
                                <c:when test="${phoneList[i] eq '017'}">
                                    <script>
                                        $('.ph_03').prop('selected', true);
                                    </script>
                                </c:when><c:when test="${phoneList[i] eq '018'}">
                                    <script>
                                        $('.ph_04').prop('selected', true);
                                    </script>
                            </c:when>


                            </c:choose>
                            <select class="input_ph" type="text" id="tel1" name="mb_tel">
                                <option  class="ph_01" value="010">010</option>
                                <option  class="ph_02" value="011" >011</option>
                                <option  class="ph_03" value="017" >017</option>
                                <option  class="ph_04" value="018" >018</option>
                            </select>

                            -<input value="${phoneList[1]}" class="input_ph" type="text" id="tel2" name="tel2" maxlength="4" oninput="this.value=this.value=replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');">

                            -<input value="${phoneList[2]}" class="input_ph" type="text" id="tel3" name="tel3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">


                        </td>
                    </tr>
                    <tr class="info_row btn_row">
                        <td colspan="2">
                            <div class="btn_wrap">
                                <button class="cancel_btn">취소</button>
                                <button class="modi_btn">수정</button>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
                </div>

            </div>
            <%-- /content_container --%>

        </div>
        <%-- /innerContent --%>
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
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/user/js/myPage_modiInfo.js"></script>
<script src="/resources/common/js/checkPW.js"></script>


</html>


