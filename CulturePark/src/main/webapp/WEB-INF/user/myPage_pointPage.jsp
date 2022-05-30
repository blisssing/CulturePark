
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
  <style><%@include file="/resources/user/css/myPage_pointPage.css"%></style>

  <%-- script --%>

  <%--Jquery & jquery-ui--%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <%----%>
  <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
  <script src="/resources/user/js/myPage_myTicket.js"></script>
  <script src="/resources/common/js/two_point_datePicker.js"></script>


  <title>point Page</title>

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
        <div class="content_container">



          <div class="label_div_section">
            <div class="myTicket_label_section">
              <span class="myTicket_label">적립금</span>
            </div>

            <p class="sectionLine_thin"></p>

          </div>

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

            <a href="javacript:fnQuickSearch('0')" class="period_btn" id="period_one" value="1개월">1개월</a>
            <a href="javacript:fnQuickSearch('90')" class="period_btn" id="period_three" value="3개월">3개월</a>
            <a href="javacript:fnQuickSearch('180')" class="period_btn" id="period_six" value="6개월">6개월</a>
            <a href="javacript:fnQuickSearch('365')" class="period_btn" id="period_oneYear" value="12개월">12개월</a>
            <a href="javacript:fnQuickSearch('0')" class="period_btn" id="period_all" value="전체">전체</a>

            <div class="datepicker_section">
              <input id="startPicker" class="startPoint"  autocomplete="off">
              <em> ~ </em>
              <input id="endPicker" class="endPoint" autocomplete="off">
            </div>

            <button class="datepicker_search_btn" id="datepicker_search_btn">조회</button>

          </div>

          <%-- ========  탭메뉴 ======== --%>
          <div class="tab_content">

            <%-- -----------  전시 ---------------%>
            <div class="table_section" id="exhibit_set">

              <table class="table">
                <thead>
                <tr>
                  <th class="create_date" id="create_date">발생일자</th>
                  <th class="save_or_use" id="save_or_use">구분</th>
                  <th class="content_point" id="content_point">내역</th>
                  <th class="save_point" id="save_point">적립</th>
                  <th class="use_point" id="use_point">사용</th>
                  <th class="balance_point" id="balance_point">잔액</th>
                </tr>
                </thead>
                <tbody>
                <tr class="table_row_section">
                  <th class="create_date">2022.05.19</td>
                  <th class="save_or_use">적립</td>
                  <th class="content_point"> 전시 적립</td>
                  <th class="save_point">10</td>
                  <th class="use_point">0</td>
                  <th class="balance_point">10</td>
                </tr>
                <tr>
                  <th class="create_date">2022.04.19</td>
                  <th class="save_or_use">사용</td>
                  <th class="content_point"> 뮤지엄 적립</td>
                  <th class="save_point">20</td>
                  <th class="use_point">20</td>
                  <th class="balance_point">0</td>
                </tr>
                <tr>
                  <th class="create_date">2022.03.15</td>
                  <th class="save_or_use">사용</td>
                  <th class="content_point"> 전시 적립</td>
                  <th class="save_point">15</td>
                  <th class="use_point">15</td>
                  <th class="balance_point">0</td>
                </tr>
                </tbody>
              </table>
            </div>


            <%--전시가 없을때--%> <%--if문으로 적용 class이름 같게함--%>
            <div class="table_section">
              <p> 거래 내역이 없습니다. </p>
            </div>
            <p class="myTicket_sectionLine"></p>

          </div> <!-- ===========  /탭 메뉴 ============== -->


        </div> <%-- /content_container --%>
      </div> <%-- /innerContent --%>
    </div> <%-- /centerContainer --%>
  </div> <%-- /mainContainer --%>

    <div class="footer_container">
      <%@ include file="/WEB-INF/user/main_footer.jsp"%>
    </div>
</div>
</body>
</html>
