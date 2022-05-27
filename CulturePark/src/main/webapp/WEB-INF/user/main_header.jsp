<%@ page pageEncoding="UTF-8" %>
<div class="header_1">

    <div class="pc_header">
        <div class="logo_section">
            <div class="logo">
                <a href="/home.do">
                    <p class="main_title">Culture Park</p>
                    <p class="sub_title"> 우리들의 문화공간</p>
                </a>
            </div>
        </div>
        <div class="function_section">
            <ul class="funcs_pc">
                <li><a class="func_list" href="#">로그인</a></li>
                <li><a class="func_list" href="#">회원가입</a></li>
                <li><a class="func_list" href="/myPage.do">마이페이지</a></li>
                <li><a class="func_list" href="/myTicket.do">마이티켓</a></li>
            </ul>

            <div class="funcs_mobile">
                <%--   로그인 창으로 이동하는 링크 달아줄 것--%>
                <button><i class="fa-solid fa-user-large"></i></button>
                <button type="button" class="open_btn"><i class="fa-solid fa-bars"></i></button>
            </div>
        </div>
    </div>
</div>

<div class="header_2_logo">
    <div class="logo_section">
        <div class="logo">
            <a href="#">
                <p class="main_title">Culture Park</p>
                <p class="sub_title"> 우리들의 문화공간</p>
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
                        <div class="menu_name">홈</div>
                    </button>
                </div>
            </li>
            <li>
                <div class="btn_box">
                    <button type="button" class="open_btn">
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
                    <button type="button" class="mymenu_btn">
                        <i class="fa-solid fa-user"></i>
                        <div class="menu_name">마이메뉴</div>
                    </button>
                </div>
            </li>
        </ul>
    </div>
</div>

