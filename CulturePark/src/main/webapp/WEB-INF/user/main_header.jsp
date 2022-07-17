<%@ page pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header_1">
    <div class="pc_header">
        <div class="logo_section">
            <div class="logo">
                <a href="/home.do">
                    <p class="main_title">Culture Park</p>
                    <p class="sub_title">our culture space</p>
                </a>
            </div>
        </div>
        <div class="function_section">
            <%
            String loginChk= (String) session.getAttribute("loginChk");

          /*  if (loginChk == null) {*/
            %>
                <c:set var="loginId" value="${sessionScope.member.mb_email}"/>
                <c:set var="loginPw" value="${sessionScope.member.mb_pw}"/>

                <c:choose>
                    <c:when test="${loginId != null && loginPw != null}">
                        <ul class="funcs_pc">
                            <li><a href="/logout.do" class="func_list" id="logoutText" >logout</a></li>
                            <li><a href="/join.do" class="func_list" >join</a></li>
                            <li><a href="/levelPage.do" class="func_list" >my page</a></li>
                            <li><a href="/myPage.do" class="func_list" >my ticket</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="funcs_pc">
                            <li><a href="login.do" class="func_list" id="loginText" >login</a></li>
                            <li><a href="/join.do" class="func_list" >join</a></li>
                            <li><a href="/levelPage.do" class="func_list" >my page</a></li>
                            <li><a href="/myPage.do" class="func_list" >my ticket</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>



            <div class="funcs_mobile">

            <c:choose>
                <c:when test="${loginId != null && loginPw != null}">
                <%--   로그인 창으로 이동하는 링크 달아줄 것--%>
                <button type="button" class="mySide_btn"><i class="fa-regular fa-user"></i></button>
                </c:when>

                <c:otherwise>
                <button type="button" class="login_btn"><i class="fa-regular fa-user"></i></button>
                </c:otherwise>
            </c:choose>

                <%--<button type="button" class="sideMenu_btn"><i class="fa-solid fa-bars"></i></button>--%>
                <button type="button" class="sideMenu_btn">
                    <div class="open-menu-button">
                        <div class="open-icon" style="display: block;">
                            <svg width="29px" height="7px" viewBox="0 0 29 7" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <g data-module="ColorItemStrokeToForeground" id="#Norgram_Mobile_Case" transform="translate(-331.000000, -117.000000)" fill-rule="nonzero" stroke="#1E1E1E" style="/* stroke: rgb(30, 30, 30); */">
                                        <g transform="translate(331.000000, 117.000000)">
                                            <path d="M29,6.5 L0,6.5"></path>
                                            <path d="M29,0.5 L0,0.5"></path>
                                        </g>
                                    </g>
                                </g>
                            </svg>
                        </div>
                        <div class="close-icon" style="display: none;">
                            <svg width="23px" height="23px" viewBox="0 0 23 23" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <g transform="translate(-337.000000, -112.000000)" fill="#1E1E1E" fill-rule="nonzero">
                                        <g transform="translate(337.000000, 112.000000)">
                                            <g>
                                                <polygon style="fill: #FFFFFF;" transform="translate(11.500000, 11.500000) rotate(-315.000000) translate(-11.500000, -11.500000) " points="26.5 11 26.5 12 -3.5 12 -3.5 11"></polygon>
                                                <polygon style="fill: #FFFFFF;" transform="translate(11.500000, 11.500000) rotate(-45.000000) translate(-11.500000, -11.500000) " points="26.5 11 26.5 12 -3.5 12 -3.5 11"></polygon>
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </svg>
                        </div>
                    </div>
                </button>

            </div>


        </div>
    </div>
</div>

<div class="header_2_logo">
    <div class="logo_section">
        <div class="logo">
            <a href="/home.do">
                <p class="main_title">Culture Park</p>
                <p class="sub_title">out culture space</p>
            </a>
        </div>
    </div>
</div>

<%-- 페이지 늘어나면 버튼에 링크 추가해줄 것  --%>
<div class="header_2">
    <div class="menu_bottom_bar">
        <ul class="bar_icons">
            <li>
                <div class="btn_box">
                    <button type="button" class="home_btn">
                        <i class="fa-solid fa-house"></i>
                        <div class="menu_name"><a href="/home.do" class="mobile_home">홈</a></div>
                    </button>
                </div>
            </li>
            <li>
                <div class="btn_box">
                    <button type="button" class="sideMenu_btn">
                        <i class="fa-solid fa-bars"></i>
                        <div class="menu_name">메뉴</div>
                    </button>
                </div>
            </li>
            <li>
                <div class="btn_box">
                    <button type="button" class="myticket_btn">
                        <i class="fa-solid fa-ticket"></i>
                        <div class="menu_name">마이티켓</div>
                    </button>
                </div>
            </li>
            <li>
                <div class="btn_box">
            <c:choose>
                <c:when test="${loginId != null && loginPw != null}">
                            <button type="button" class="mySide_btn">
                                <i class="fa-solid fa-user"></i>
                                <div class="menu_name">마이메뉴</div>
                            </button>
                </c:when>
                <c:otherwise>
                            <button type="button" class="login_btn">
                                <i class="fa-solid fa-user"></i>
                                <div class="menu_name">마이메뉴</div>
                            </button>
                </c:otherwise>
            </c:choose>
                </div>
            </li>
        </ul>
    </div>
</div>
