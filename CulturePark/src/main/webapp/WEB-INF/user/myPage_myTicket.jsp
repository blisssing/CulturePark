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

    <style><%@include file="/resources/user/css/common_header.css"%></style>
    <style><%@include file="/resources/user/css/common_footer.css"%></style>
    <style><%@include file="/resources/user/css/common_side.css"%></style>

    <style><%@include file="/resources/user/css/myPage.css" %></style>
    <style><%@include file="/resources/user/css/myPage_subMenu.css" %></style>
    <style><%@include file="/resources/user/css/myPage_myTicket.css" %></style>


    <%-- script --%>

    <%--Jquery & jquery-ui--%>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <%----%>
        <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
        <script src="/resources/common/js/common.js"></script>
        <script src="/resources/user/js/myPage_myTicket.js"></script>


    <title>my Ticket</title>

    <%
        String loginChk_ = (String) session.getAttribute("loginChk");

        if (loginChk_ == null) {
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
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
        <%@ include file="/WEB-INF/user/main_side.jsp"%>
    </div>

    <%-- center --%>
    <div class="centerContainer">
        <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
        <%-- 이곳에 페이지를 import --%>
        <%--index--%>

        <%-- 내부 영역을 한 번 감싸주는 영역.  --%>
        <div class="innerContainer">

                <%-- subMenu --%>
                <div class="subMenu_container">
                    <%@ include file="/WEB-INF/user/myPage_subMenu.jsp"%>
                </div>

                <%-- content --%>
                <%-- include 하지않고, 직접 기재 (content관련 css는 myPage.css) --%>
                <div class="content_container">


                        <div class="myTicket_label_section">
                            <span class="myTicket_label">마이 티켓</span>
                        </div>

                    <p class="sectionLine_thin"></p>

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

                    <%-- pc --%>
                    <div class="period_section">
                        <span class="period_choice">조회기간 선택</span>
                            <a href="javacript:fnQuickSearch('0')" class="period_btn" id="period_one" value="1개월">1개월</a>
                            <a href="javacript:fnQuickSearch('90')" class="period_btn" id="period_three" value="3개월">3개월</a>
                            <a href="javacript:fnQuickSearch('180')" class="period_btn" id="period_six" value="6개월">6개월</a>
                            <a href="javacript:fnQuickSearch('365')" class="period_btn" id="period_oneYear" value="12개월">12개월</a>
                            <a href="javacript:fnQuickSearch('0')" class="period_btn" id="period_all" value="전체">전체</a>

                        <div class="datepicker_section">
                            <input id="startPicker" class="startPoint">
                            <em> ~ </em>
                            <input id="endPicker" class="endPoint">
                        </div>
                        <button class="datepicker_search_btn" id="datepicker_search_btn">조회</button>
                    </div>



                    <div class="menu_section">
                        <button class="menu_btn" id="all_view_btn">전체</button>
                        <button class="menu_btn" id="exhibit_btn" >전시</button>
                        <button class="menu_btn" id="museum_btn" >뮤지엄</button>
                    </div>


                    <div id="exhibit_set">
                        <%-- 전시 라벨 --%>
                        <div class="label_exhibit_section">
                           <span class="label_section"> 전시 </span>
                       </div>

                        <p class="sectionLine_thin"></p>


                        <%-- 테이블 구성 --%>
                        <div class="fix_relative">

                        <div class="scroll_section">

                        <table class="table_list">

                            <thead>
                            <tr>
                                <th class="seq" id="seq">seq</th>
                                <th class="booking_day"id="booking_day">예매일</th>
                                <th class="pd_name" id="pd_name">작품명</th>
                                <th class="pd_date" id="viewing_date">관람날짜</th>
                                <th></th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr class="table_row_section">
                                <th class=seq">1</td>
                                <th class="booking_day">2022.05.11</td>
                                <th class="pd_name">스누피</td>
                                <th class="pd_date">2022.05.12</td>

                                <%-- pc 상세보기 버튼 --%>
                                <td>
                                    <div class="view_btn_section">
                                        <button class="view_btn" id="view_detail" onclick="viewDetail();">상세보기</button>
                                        <button class="view_btn" id="view_ticket" onclick="viewTicket();">티켓보기</button>
                                    </div>
                                </td>
                            </tr>

                            <%-- mobile 상세보기 버튼 --%>
                            <tr>
                                <th colspan="4" class="m_view_btn_section">
                                    <button class="m_view_btn" id="m_view_detail" onclick="viewDetail();">상세보기</button>
                                    <button class="m_view_btn" id="m_view_ticket" onclick="viewTicket();">티켓보기</button>
                                </th>
                            </tr>

                            <tr>
                                <th class="seq">2</th>
                                <th class="booking_day">2022.04.11</th>
                                <th class="pd_name">라이프 사진전</th>
                                <th class="pd_date">2022.04.12</th>
                                <td>
                                </td>
                            </tr>

                            <tr>
                                <th class="seq">3</th>
                                <th class="booking_day">2022.03.11</th>
                                <th class="pd_name">사울레이터</th>
                                <th class="pd_date">2022.03.12</th>
                                <td>
                                </td>
                            </tr>

                            <tr>
                                <th class="seq">4</th>
                                <th class="booking_day">2022.03.11</th>
                                <th class="pd_name">반 고흐</th>
                                <th class="pd_date">2022.03.12</th>
                                <td>
                                </td>
                            </tr>

                            <tr>
                                <th class="seq">5</th>
                                <th class="booking_day">2022.03.11</th>
                                <th class="pd_name">모네 특별전</th>
                                <th class="pd_date">2022.03.12</th>
                                <td>
                                </td>
                            </tr>

                        </tbody>

                    </table>
                    </div> <%-- /scroll_section --%>
                    </div> <%-- /fix_section --%>
                    </div> <%--/exhibit_set--%>


                    <div id="museum_set">
                            <%-- 뮤지엄 라벨 --%>
                            <div class="label_museum_section">
                                <span class="label_section"> 뮤지엄 </span>
                            </div>

                            <p class="sectionLine_thin"></p>

                            <%-- scroll --%>
                            <div class="scroll_section">

                            <table class="table_list">
                                <thead>
                                    <tr>
                                        <th class="seq" id="seq_museum">seq</th>
                                        <th class="booking_day" id="bookingDay_museum">예매일</th>
                                        <th class="pd_name" id="exhibitName_museum">전시명</th>
                                        <th class="pd_date" id="viewingDate_museum">관람날짜</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr class="table_row_section">
                                        <th class="seq">1</td>
                                        <th class="booking_day">2022.05.11</td>
                                        <th class="pd_name">박물관이 살아있다</td>
                                        <th class="pd_date">2022.05.12</td>

                                     <%-- pc 상세보기 버튼 --%>
                                        <td>
                                            <div class="view_btn_section">
                                                <button class="view_btn" id="view_detail_museum" onclick="viewDetail();">상세보기</button>
                                                <button class="view_btn" id="view_ticket_museum" onclick="viewTicket();">티켓보기</button>
                                            </div>
                                        </td>
                                     </tr>

                                    <%-- mobile 상세보기 버튼 --%>
                                    <tr>
                                        <th colspan="4" class="m_view_btn_section">
                                            <button class="m_view_btn" id="m_view_detail_museum" onclick="viewDetail();">상세보기</button>
                                            <button class="m_view_btn" id="m_view_ticket_museum" onclick="viewTicket();">티켓보기</button>
                                        </th>
                                    </tr>

                                    <tr>
                                        <th class="seq">2</th>
                                        <th class="booking_day">2022.04.11</th>
                                        <th class="pd_name">허브 아일랜드</th>
                                        <th class="pd_date">2022.04.12</th>
                                        <td>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th class="seq">3</th>
                                        <th class="booking_day">2022.03.11</th>
                                        <th class="pd_name">테디베어 박물관</th>
                                        <th class="pd_date">2022.03.12</th>
                                        <td>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th class="seq">4</th>
                                        <th class="booking_day">2022.03.11</th>
                                        <th class="pd_name">해녀 박물관</th>
                                        <th class="pd_date">2022.03.12</th>
                                        <td>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th class="seq">5</th>
                                        <th class="booking_day">2022.03.11</th>
                                        <th class="pd_name">레고 박물관</th>
                                        <th class="pd_date">2022.03.12</th>
                                        <td>
                                        </td>
                                    </tr>

                                </tbody>

                            </table> <%-- /table --%>
                        </div> <%-- /scroll --%>
                    </div> <%-- /museum_set --%>

                        <%--전시가 없을때--%> <%--if문으로 적용 class이름 같게함--%>
                        <div class="table_section">
                            <p> 최근 예매 내역이 없습니다.</p>

                            <div class="view_btn_section">
                                <button class="view_btn" id="view_pd"><a href="/home.do" target="_self"> 보러가기 </a></button>
                            </div>

                        </div>
                        <p class="myTicket_sectionLine"></p>

                </div> <%-- /content_container --%>
            </div> <%-- /innerContent --%>
        </div> <%-- /centerContainer --%>

        <div class="footer_container">
            <%@ include file="/WEB-INF/user/main_footer.jsp"%>
        </div>
    </div> <%-- /mainContainer --%>
</body>


<%--<script src="/resources/common/js/2point_calendar.js"></script>--%>
<%--<script src="/resources/common/js/calendar.js"></script>&ndash;%&gt;--%>




</html>