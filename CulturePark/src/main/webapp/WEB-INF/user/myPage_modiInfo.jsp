<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modi_section">
    <meta charset="utf-8">
    <div class="section_title">회원정보 수정</div>

    <table class="info_table">
        <tbody>
            <tr class="info_row id_row">
                <td class="info_head">아이디</td>
                <td class="info_content">
                    UserID
                </td>
            </tr>
            <tr class="info_row nickname_row">
                <td class="info_head">닉네임</td>
                <td class="info_content">
                    <div><input type="text" name="input_nick"></div>
                </td>
            </tr>
            <tr class="info_row pw_row">
                <td class="info_head">비밀번호</td>
                <td class="info_content pw_content">
                    <div><input type="password" name="input_pw"></div>
                    <div class="alert_text_01">비밀번호를 변경하지 않을 경우 빈칸으로 남겨주세요</div>
                </td>
            </tr>
            <tr class="info_row sc_pw_row">
                <td class="info_head">2차 비밀번호</td>
                <td class="info_content pw_content">
                    <div><input type="password" name="input_sc_pw"></div>
                    <div class="alert_text_02">서로 다른 비밀번호 입니다. 다시 입력해주세요 </div>
                </td>
            </tr>

            <tr class="info_row name_row">
                <td class="info_head">이름</td>
                <td class="info_content">
                    UserName
                </td>
            </tr>
            <tr class="info_row birth_row">
                <td class="info_head">생년월일</td>
                <td class="info_content">
                    <div class="content_text" id="member_year">1996</div>-
                    <div class="content_text" id="member_month">09</div>-
                    <div class="content_text" id="member_day">21</div>
                </td>
            </tr>
            <tr class="info_row gender_row">
                <td class="info_head">성별</td>
                <td class="info_content">
                    <input type="radio" name="chk_gender" value="male" checked="checked"> 남
                    <input type="radio" name="chk_gender" value="female"> 여
                </td>
            </tr>
            <tr class="info_row ph_row">
                <td class="info_head">전화번호</td>
                <td class="info_content">
                    <select class="input_ph" type="text" name="ph_01">
                        <option value="010" selected="selected">010</option>
                        <option value="011" >011</option>
                        <option value="017" >017</option>
                        <option value="018" >018</option>
                    </select>
                    -
                    <input class="input_ph" type="text" name="ph_02">
                    -
                    <input class="input_ph" type="text" name="ph_03">

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
    <script><%@include file="/resources/user/js/myPage_modiInfo.js"%></script>
</div>



