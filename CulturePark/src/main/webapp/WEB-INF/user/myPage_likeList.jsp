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
    <style><%@include file="/resources/user/css/myPage_likeList.css" %></style>

    <title>like List</title>

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

                <%-- content --%>
                <%-- include 하지않고, 직접 기재 (content관련 css는 myPage.css) --%>
                <div class="content_container"><div style="clear:both;"></div>


                    <div class="likeList_label_section">
                        <span class="likeList_label">나의 찜 목록</span>
                    </div>

                    <p class="sectionLine_thin"></p>

                    <div class="menu_section">
                        <button class="menu_btn" id="all_view_btn">전체</button>
                        <button class="menu_btn" id="exhibit_btn">전시</button>
                        <button class="menu_btn" id="museum_btn">뮤지엄</button>
                    </div>



                    <div id="exhibit_set">
                            <%-- 전시 라벨 --%>
                            <div class="label_exhibit_section">
                                <span class="label_section">  전시  </span>
                            </div>

                            <p class="sectionLine_thin"></p>


                            <%-- 테이블 구성 --%>
                            <div class="fix_relative">

                            <div class="scroll_section">

                            <table class="table_list">

                                <thead>
                                <tr>
                                    <th class="cal_check check_all check_all_exhibit" name="check_all_exhibit"><input type="checkbox" id="check_all_exhibit"></th>
                                    <th class="seq">seq</th>
                                    <th class="pd_name">작품명</th>
                                    <th class="pd_price">금액</th>
                                </tr>
                                </thead>


                                <tbody>
                                     <tr class="table_row_section">
                                        <td class="cal_check"><input type="checkbox" name="chk1" class="check_one check_one_exhibit" id="check_one_exhibit" ></td>
                                        <td class="seq">1</td>
                                        <td class="pd_name">스누피</td>
                                        <td class="pd_price">13,000</td>
                                    </tr>
                                    <tr>
                                        <td class="cal_check"><input type="checkbox" name="chk1" class="check_one check_one_exhibit" id="check_one_exhibit2"></td>
                                        <td class="seq">2</td>
                                        <td class="pd_name">요시고</td>
                                        <td class="pd_price">17,000</td>
                                    </tr>
                                     <tr>
                                         <td class="cal_check"><input type="checkbox" name="chk1" class="check_one check_one_exhibit" id="check_one_exhibit3"></td>
                                         <td class="seq">3</td>
                                         <td class="pd_name">사울레이터</td>
                                         <td class="pd_price">17,000</td>
                                     </tr>
                                     <tr>
                                         <td class="cal_check"><input type="checkbox" name="chk1" class="check_one check_one_exhibit" id="check_one_exhibit4"></td>
                                         <td class="seq">4</td>
                                         <td class="pd_name">라이프사진전</td>
                                         <td class="pd_price">17,000</td>
                                     </tr>
                                     <tr>
                                         <td class="cal_check"><input type="checkbox" name="chk1" class="check_one check_one_exhibit" id="check_one_exhibit5"></td>
                                         <td class="seq">5</td>
                                         <td class="pd_name">반고흐</td>
                                         <td class="pd_price">17,000</td>
                                     </tr>
                                     <tr>
                                         <td class="cal_check"><input type="checkbox" name="chk1" class="check_one check_one_exhibit" id="check_one_exhibit6"></td>
                                         <td class="seq">6</td>
                                         <td class="pd_name">모네 특별전</td>
                                         <td class="pd_price">17,000</td>
                                     </tr>
                                </tbody>

                            </table>
                            </div> <%-- scroll_section --%>
                            </div> <%-- fix_section --%>
                        </div>


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
                                    <th class="cal_check check_all check_all_museum"name="check_all_museum"><input type="checkbox" id="check_all_museum"></th>
                                    <th class="seq">seq</th>
                                    <th class="pd_name">작품명</th>
                                    <th class="pd_price">금액</th>
                                </tr>
                            </thead>


                            <tbody>
                                <tr class="table_row_section">
                                    <td class="cal_check" ><input type="checkbox" name="chk2" class="check_one check_one_museum" id="check_one_museum"></td>
                                    <td class="seq">1</td>
                                    <td class="pd_name">박물관이 살아있다</td>
                                    <td class="pd_price">12,000</td>
                                </tr>
                                <tr>
                                    <td class="cal_check"><input type="checkbox" name="chk2" class="check_one check_one_museum" id="check_one_museum2"></td>
                                    <td class="seq">2</td>
                                    <td class="pd_name">허브아일랜드</td>
                                    <td class="pd_price">17,000</td>
                                </tr>
                                <tr>
                                    <td class="cal_check" ><input type="checkbox" name="chk2" class="check_one check_one_museum" id="check_one_museum3"></td>
                                    <td class="seq">3</td>
                                    <td class="pd_name">제주 아일랜드</td>
                                    <td class="pd_price">12,000</td>
                                </tr>
                                <tr>
                                    <td class="cal_check" ><input type="checkbox" name="chk2" class="check_one check_one_museum" id="check_one_museum4"></td>
                                    <td class="seq">4</td>
                                    <td class="pd_name">대천 머드 축제</td>
                                    <td class="pd_price">12,000</td>
                                </tr>
                                <tr>
                                    <td class="cal_check" ><input type="checkbox" name="chk2" class="check_one check_one_museum" id="check_one_museum5"></td>
                                    <td class="seq">5</td>
                                    <td class="pd_name">레고 박물관</td>
                                    <td class="pd_price">12,000</td>
                                </tr>
                                <tr>
                                    <td class="cal_check" ><input type="checkbox" name="chk2" class="check_one check_one_museum" id="check_one_museum6"></td>
                                    <td class="seq">6</td>
                                    <td class="pd_name">해녀 박물관</td>
                                    <td class="pd_price">12,000</td>
                                </tr>

                                </tbody>

                            </table> <%-- table --%>
                            </div> <%-- scroll --%>
                    </div>

                        <%--전시가 없을때--%> <%--if문으로 적용 class이름 같게함--%>
                        <div class="table_section">
                            <p> 찜 리스트에 담긴 전시가 없습니다. </p>

                            <div class="view_btn_section">
                                <button class="view_btn" id="view_pd"><a href="/home.do" target="_self"> 보러가기 </a></button>
                            </div>
                        </div>

                        <p class="sectionLine_"></p>

                        <div class="pd_delete_section">
                            <div class="pd_delete">
                                <span>선택한 상품</span><a class="delete_btn" id="checked_delete">삭제</a>
                            </div>
                        </div>





                </div> <%-- /content_container --%>

            </div> <%-- /innerContent --%>
        </div> <%-- /centerContainer --%>
    </div> <%-- /mainContainer --%>
</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/myPage_likeList.js"></script>

</html>