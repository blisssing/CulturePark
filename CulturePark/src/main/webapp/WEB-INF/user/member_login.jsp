<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/common/css/common.css" %></style>
    <style><%@include file="/resources/user/css/member_login.css" %></style>

    <title>login</title>

    <c:if test="${message == 'logout' }">
        <script type='text/javascript'>
            alert('로그아웃되었습니다.');
        </script>
    </c:if>

    <%--<%
   쿠키  https://great-yo.tistory.com/74
   아이디 셋팅을 위한 https://record-than-remember.tistory.com/entry/%EB%A1%9C%EA%B7%B8%EC%9D%B8-%E2%86%92-%EB%A1%9C%EA%B7%B8%EC%95%84%EC%9B%83-%EB%B2%84%ED%8A%BC

        String loginChk_ = (String) session.getAttribute("loginChk");

        if (loginChk_ == null) {
    %>

    <script> location.href="/login.do"</script>

    <% }
    %>--%>


 <%--  <%
	/*String remember = (String) request.getAttribute("remember");*/

   String remember = (String) session.getAttribute("remember");

	if(remember == null) {
		remember = "";
	}
    %>

    <%
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("remember")) {
                    request.setAttribute("remember", cookie.getValue());
                }
            }
        }
    %>--%>

</head>

<body>

<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

    <div class="centerContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

            <div class="content_container">
                <div class="login_container">
                    <div class="back_section">
                        <div class="arrow_section">
                            <i class="fa-solid fa-arrow-left"></i>
                            <div class="back">뒤로가기</div>
                        </div>
                    </div>

                    <div class="culturePark_section">
                        <a href="home.do"><span class="culturePark">Culture Park</span></a>
                    </div>


                <p class="sectionLine_thin"></p>

                <%--------------- pc ----------------%>

                    <%-- 로그인 전체 틀 --%>
                    <div class="pc_login">
                        <div class="div_row_section">

                            <%--왼쪽--%>
                            <div class="left_section">
                                <div class="id_label">아이디</div>
                                <div class="pw_label">비밀번호</div>
                            </div>

                            <%--가운데--%>
                            <div class="center_section">
                                <input name="mb_email" type="text" class="id_value p_id_value" required/>
                                <input name="mb_pw" type="password" class="pw_value p_pw_value"/>
                            </div>

                            <%--오른쪽--%>
                            <div class="right_section">
                                <div class="login_btn_section">
                                    <input class="login_btn login_btn_p" type="button" value="로그인">
                                </div>
                            </div>
                        </div>

                        <%-- 가로 영역 --%>
                        <div class="section_two">
                            <div class="save_id_section">
                                <div class="checkbox_section">
                                    <input class="checkbox_save_id checkbox_save_id_p" type="checkbox" name="remember"
                                           required value="아이디저장">
                                    <div class="save_id">아이디 기억하기</div>
                                </div>
                            </div>

                            <div class="join_section">
                                <input class="join_btn join_btn_p" type="submit" value="회원가입">
                            </div>

                            <div class="find_section">
                                <button class="find_id find_id_p">아이디 찾기</button>
                                <button class="find_pw find_pw_p">비밀번호 찾기</button>
                            </div>
                        </div>

                    </div>

                    <%------------- mobile ------------%>


                    <%-- 로그인 전체 틀 --%>
                    <div class="m_div_row_section">

                        <div class="m_div_row_inner">

                            <%-- 아이디 라벨 --%>
                            <div class="m_id_section">
                                <div class="m_id_label">아이디</div>
                            </div>

                            <%-- 아이디 값 --%>
                            <div class="m_id_value_section">
                                <input name="mb_email" class="m_id_value" type="text"/>
                            </div>

                            <%-- 비밀번호 라벨 --%>
                            <div class="m_pw_section">
                                <div class="m_pw_label">비밀번호</div>
                            </div>

                            <%-- 비밀번호 값 --%>
                            <div class="m_pw_value_section">
                                <input name="mb_pw" class="m_pw_value" type="password"/>
                            </div>

                            <%-- 로그인 버튼 --%>
                            <div class="m_login_btn_section">
                                <input class="login_btn login_btn_m" type="button" value="로그인">
                            </div>

                            <%-- 아이디 저장 및  로그인 상태 유지 --%>
                            <div class="m_id_save_section">
                                <div class="m_id_save_div">
                                    <input class="checkbox_save_id checkbox_save_id_m" type="checkbox" name="save_id"
                                           value="아이디저장">
                                    <span class="m_save_id">아이디 저장</span>
                                </div>
                            </div>


                            <%-- 아이디/비밀번호 찾기  // 회원가입 --%>
                            <div class="m_find_section">
                                <div class="m_find">
                                    <a href="/findId.do.ado" class="find_id find_id_m">아이디 찾기</a>
                                    <a href="/findPw.do.ado" class="find_pw find_pw_m">비밀번호 찾기</a>
                                </div>
                                <div class="m_join">
                                    <a href="/join.do" class="join_btn join_btn_m" >회원가입</a>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>  <%-- login_container --%>
            </div>  <%-- content_container --%>
        </div>  <%-- /centerContainer --%>
    </div>  <%-- /mainContainer --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/member_login.js"></script>

</html>
