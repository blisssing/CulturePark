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
    <style><%@include file="/resources/user/css/login.css" %></style>

    <title>login</title>
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

        <%-- 내부 영역을 한 번 감싸주는 영역 --%>
        <div class="innerContainer">

            <%-- subMenu --%>
            <div class="subMenu_container">
                <%@ include file="/WEB-INF/user/myPage_subMenu.jsp"%>
            </div>

            <%-- content --%> <%-- include 하지않고, 직접 기재 (content관련 css는 myPage.css) --%>
            <div class="content_container"><div style="clear:both;"></div>

                <div class="writeReview_label_section">
                    <span class="writeReview_label">리뷰 작성</span>
                </div>

                <p class="sectionLine_thin"></p>

                <div class="booking_info_section">

                    <div class="pd_label_section">
                        <span class="pd_name">사울 레이터 창문을 통해 어렴풋이</span>
                        <a class="modal_href" href="#modal" rel="modal:open">유의사항
                            <i class="fa-solid fa-square-caret-down"></i></a>
                    </div>

                    <div class="label_section">
                        <span>[</span><span class="booking_place">피크닉</span><span>]</span>
                    </div>

                    <div class="label_section">
                        <span class="visit_date">2022.01.11</span><span>방문</span>
                    </div>

                </div>
                <%-- booking_info_section --%>

                <%-- 별점 영역 --%>
                <div class="score_section">
                <span class="star-input">
                    <span class="input">
                        <input type="radio" name="star-input" value="1" id="p1">
                        <label for="p1">1</label>
                        <input type="radio" name="star-input" value="2" id="p2">
                        <label for="p2">2</label>
                        <input type="radio" name="star-input" value="3" id="p3">
                        <label for="p3">3</label>
                        <input type="radio" name="star-input" value="4" id="p4">
                        <label for="p4">4</label>
                        <input type="radio" name="star-input" value="5" id="p5">
                        <label for="p5">5</label>
                    </span>
                    <output for="star-input" class="star_point"><b>0</b>점
                    </output>
                </span>
                </div>

                <%--  &lt;%&ndash; 별점 영역 &ndash;%&gt;
                  <div class="score_section">
                      <span class="star on" onClick="setStar(1)">★</span>
                      <span class="star" onClick="setStar(2)">★</span>
                      <span class="star" onClick="setStar(3)">★</span>
                      <span class="star" onClick="setStar(4)">★</span>
                      <span class="star" onClick="setStar(5)">★</span>

                      <span class="score_good">4.5</span><span>점</span>
                  </div>--%>


                <div class="review_title_section">
                    <%-- 제목 영역 --%>
                    <div class="title_section">
                        <span class="title_label">제목</span>
                        <div class="review_title" type="textFiled" aria-placeholder="제목입력"></div>
                    </div>

                    <%-- 사진 추가 영역 --%>
                    <div class="photo_section">
                        <span class="upload_label">사진추가</span>
                        <div class="fileUpload_section">
                            <input class="file" type="file" id="file" aria-placeholder="사진업로드" onclick="regist()";>
                        </div>
                    </div>
                </div>

                <%-- 감상평 등록 영역 --%>
                <div class="content_section">
                    <div type="textArea" class="content_text" aria-placeholder="내용입력"></div>
                </div>

                <%-- 리뷰 등록 버튼 영역 --%>
                <%-- mobile --%>
                <div class="m_upload_btn_section">
                    <button class="m_upload_btn" type="submit">리 뷰 등 록</button>
                </div>

                <%-- pc --%>
                <div class="upload_btn_section">
                    <button class="upload_btn" type="submit">리 뷰 등 록</button>
                </div>



                <%-- ---------- 모달 --------------- --%>

                <div class="modalContainer" id="modal">

                    <div class="modal_head">
                        <div class="modal_title">리뷰 작성 시 유의사항</div>
                    </div>
                    <p class="sectionLine_list"></p>

                    <ul class="modal_content">
                        <li>
                            리뷰는 이용 후 30일까지 작성 가능합니다.
                        </li>
                        <li>
                            동일 예매건에 대한 리뷰 적립 혜택은 1회로 제한되며, 회원별 1일 최대 5건까지만 포인트가 지급됩니다.
                        </li>
                        <li class="notice_list">
                            <ul class="ul_list">
                                리뷰 운영 정책을 위반한 경우, 통보 없이 리뷰가 삭제되고, 지급된 포인트가 회수 될 수 있습니다.
                                <li> 정상 이용 완료되지 않은 예매에 대해 리뷰를 작성한 경우</li>
                                <li> 업체와 무관한 내용이나 동일 문자의 반복 등 부적합한 내용이 있는 경우</li>
                                <li> 욕설, 비방, 명예훼손을 포함한 내용이 있는 경우</li>
                                <li> 저작권, 초상권 등 타인의 권리를 침해하는 이미지를 포함한 경우</li>
                            </ul>
                        </li>
                    </ul>

                </div>



                <%--전시가 없을때--%> <%--if문으로 적용 class이름 같게함--%>
                <div class="table_section">
                    <p> 작성가능한 리뷰가 없습니다. </p>
                    <div class="view_btn_section">
                        <button class="view_btn" id="view_pd">보러가기</button>
                    </div>
                </div>

                <p class="sectionLine_thin"></p>


            </div> <%-- /content_container --%>

        </div> <%-- /innerContent --%>
    </div> <%-- /centerContainer --%>
</div> <%-- /mainContainer --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<%--<script src="/resources/user/js/login.js"></script>--%>

</html>
