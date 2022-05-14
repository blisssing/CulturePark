<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style><%@include file="/resources/common/css/header.css"%></style>
    <style><%@include file="/resources/user/css/myPage.css" %></style>
    <style><%@include file="/resources/user/css/myPage_subMenu.css" %></style>
    <style><%@include file="/resources/user/css/myPage_myTicket.css" %></style>

    <title>myTicket</title>
</head>
<body>
<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
    <%-- haader --%>
    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
    </div>
    <%-- center --%>
    <div class="centerContainer">
        <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
        <%-- 이곳에 페이지를 import --%>
        <%--index--%>
        <%-- 내부 영역을 한 번 감싸주는 영역.  --%>
        <div class="innerContainer">
            <div class="innerContainer">
                <%-- subMenu --%>
                <div class="subMenu_container">
                    <%@ include file="/WEB-INF/user/myPage_subMenu.jsp"%>
                </div>
                <%-- content --%>
                <%-- include 하지않고, 직접 기재 (content관련 css는 myPage.css) --%>
                <div class="content_container"><div style="clear:both;"></div>

                    <%-- mobile --%>
                    <div class="m_period_section">
                        <p class="m_period_choice">조회기간 선택</p>
                        <div class="m_period_btn_section">
                            <button class="m_period_btn" id="m_period_one" value="1개월">1개월</button>
                            <button class="m_period_btn" id="m_period_three" value="3개월">3개월</button>
                            <button class="m_period_btn" id="m_period_six" value="6개월">6개월</button>
                            <button class="m_period_btn" id="m_period_oneYear" value="12개월">12개월</button>
                            <button class="m_period_btn" id="m_period_all" value="전체">전체</button>
                        </div>
                    </div>
                    <%-- mobile --%>
                    <%-- pc --%>
                    <div class="period_section">
                        <span class="period_choice">조회기간 선택</span>
                        <button class="period_btn" id="period_one" value="1개월">1개월</button>
                        <button class="period_btn" id="period_three" value="3개월">3개월</button>
                        <button class="period_btn" id="period_six" value="6개월">6개월</button>
                        <button class="period_btn" id="period_oneYear" value="12개월">12개월</button>
                        <button class="period_btn" id="period_all" value="전체">전체</button>
                    </div>

                    <%-- /pc --%>
                    <div class="menu_section">
                        <button class="menu_btn" id="all_view_btn">전체</button>
                        <button class="menu_btn" id="exhibit_btn">전시</button>
                        <button class="menu_btn" id="museum_btn">뮤지엄</button>
                    </div>


                    <%-- ========  탭메뉴 ======== --%>
                    <div class="tab_content">

                    <%-- -----------  전시 ---------------%>
                    <div class="table_section" id="exhibit_set">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="th_scope" id="seq">seq</th>
                                <th class="th_scope"id="bookingDay">예매일</th>
                                <th class="th_scope" id="exhibitName">전시명</th>
                                <th class="th_scope" id="viewingDate">관람날짜</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="table_row_section">
                                <th scope="row">1</td>
                                <th scope="row">2022.05.11</td>
                                <th scope="row">스누피</td>
                                <th scope="row">2022.05.12</td>

                                <%-- pc --%>
                                <td>
                                    <div class="view_btn_section">
                                        <button class="view_btn" id="view_detail" onclick="viewDetail();">상세보기</button>
                                        <button class="view_btn" id="view_ticket" onclick="viewTicket();">티켓보기</button>
                                    </div>
                                </td>
                            </tr>
                            <%-- mobile --%>
                            <tr>
                                <th colspan="4" class="m_view_btn_section">
                                    <button class="m_view_btn" id="m_view_detail" onclick="viewDetail();">상세보기</button>
                                    <button class="m_view_btn" id="m_view_ticket" onclick="viewTicket();">티켓보기</button>
                                </th>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <th scope="row">2022.04.11</th>
                                <th scope="row">라이프 사진전</th>
                                <th scope="row">2022.04.12</th>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <th scope="row">2022.03.11</th>
                                <th scope="row">사울레이터</th>
                                <th scope="row">2022.03.12</th>
                                <td>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                        <%-- -------------- 뮤지엄 ---------------- --%>
                        <div class="table_section" id="museum_set">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="th_scope" id="seq_museum">seq</th>
                                    <th class="th_scope"id="bookingDay_museum">예매일</th>
                                    <th class="th_scope" id="exhibitName_museum">전시명</th>
                                    <th class="th_scope" id="viewingDate_museum">관람날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="table_row_section">
                                    <th scope="row">1</td>
                                    <th scope="row">2022.05.11</td>
                                    <th scope="row">박물관이 살아있다</td>
                                    <th scope="row">2022.05.12</td>

                                    <%-- pc --%>
                                    <td>
                                        <div class="view_btn_section">
                                            <button class="view_btn" id="view_detail_museum" onclick="viewDetail();">상세보기</button>
                                            <button class="view_btn" id="view_ticket_museum" onclick="viewTicket();">티켓보기</button>
                                        </div>
                                    </td>
                                </tr>

                                <%-- mobile --%>
                                <tr>
                                    <th colspan="4" class="m_view_btn_section">
                                        <button class="m_view_btn" id="m_view_detail_museum" onclick="viewDetail();">상세보기</button>
                                        <button class="m_view_btn" id="m_view_ticket_museum" onclick="viewTicket();">티켓보기</button>
                                    </th>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <th scope="row">2022.04.11</th>
                                    <th scope="row">허브 아일랜드</th>
                                    <th scope="row">2022.04.12</th>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <th scope="row">2022.03.11</th>
                                    <th scope="row">테디베어 박물관</th>
                                    <th scope="row">2022.03.12</th>
                                    <td>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <%--전시가 없을때--%> <%--if문으로 적용 class이름 같게함--%>
                        <div class="table_section">
                            <p> 최근 예매 내역이 없습니다.</p>
                        </div>
                        <p class="sectionLine"></p>

                </div> <!-- ===========  /탭 메뉴 ============== -->


                </div> <%-- /content_container --%>
            </div> <%-- /innerContent --%>
        </div> <%-- /centerContainer --%>
    </div> <%-- /mainContainer --%>
</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/myPage_myTicket.js"></script>
<script src="/resources/user/js/myPage_view_Detail_Ticket.js"></script>

</html>