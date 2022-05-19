<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%--  css 불러오기  --%>
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/common/css/common.css"%></style>
    <style><%@include file="/resources/common/css/header.css"%></style>
    <style><%@include file="/resources/user/css/main_home.css"%></style>
    <style><%@include file="/resources/user/css/board_section.css"%></style>
    <style><%@include file="/resources/user/css/main_pdMainPage.css"%></style>

    <%--  js 불러오기  --%>



    <title>CulturePark 우리들의 문화공간</title>
</head>
<body>

<div class="mainContainer">

    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
        <%@ include file="/WEB-INF/user/main_side.jsp"%>
    </div>

    <%-- Contents 영역 --%>
    <div class="centerContainer">

        <div class="fast_btn_section">
            <div class="fast_button_box"><button class="fast_button" id="fast_btn_01">전 체 목 록</button></div>
            <div class="fast_button_box"><button class="fast_button" id="fast_btn_02">랭 킹 목 록</button></div>
            <div class="fast_button_box"><button class="fast_button" id="fast_btn_03">리 뷰 목 록</button></div>
        </div>

        <div class="event_section">
            <div class="section_name">
                <span class="section_title">이벤트</span>
            </div>
            <div class="slide_section" id="slide_event">
                <ul class="img_box">
                    <%-- 이미지 규격 1200*400 --%>
                    <li class="img_list" id="ev_img_li_01"><img src="/resources/user/resource/home/event_img_01.png"></li>
                    <li class="img_list" id="ev_img_li_02"><img src="/resources/user/resource/home/event_img_02.png"></li>
                    <li class="img_list" id="ev_img_li_03"><img src="/resources/user/resource/home/event_img_03.png"></li>
                </ul>
                <div class="btn_section">
                    <button type="button" id="ev_prev" class="btn_prev"><i class="fa-solid fa-angle-left"></i></button>
                    <button type="button" id="ev_next" class="btn_next"><i class="fa-solid fa-angle-right"></i></button>
                </div>
                <div class="radio_section">
                    <input type="radio" id="evt_chk_01" name="evt_chk" checked="checked">
                    <input type="radio" id="evt_chk_02" name="evt_chk">
                    <input type="radio" id="evt_chk_03" name="evt_chk">
                </div>
            </div>
        </div>

        <div class="ex_promotion_section">
            <div class="section_name">
                <span class="section_title">랭 킹</span>
                <span class="prom_link"><a href="#">전 체 보 기</a></span>

            </div>

            <div class="section_page">
                <span id="ex_page_num">1</span><span>/2</span>
            </div>

            <div class="slide_section_pc" id="slide_ex">

                <ul class="prom_box" id="ex_prom">
                    <li class="prom_list" id="ex_prom_img_01">
                        <img src="/resources/user/resource/home/ex_prom_01.png">
                        <div class="img_description">
                            <div class="img_rank"> 1 </div>
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>
                        </div>


                    </li>
                    <li class="prom_list" id="ex_prom_img_02">
                        <img src="/resources/user/resource/home/ex_prom_02.png">
                        <div class="img_description">
                            <div class="img_rank"> 2 </div>
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>
                        </div>


                    </li>
                    <li class="prom_list" id="ex_prom_img_03">
                        <img src="/resources/user/resource/home/ex_prom_03.png">
                        <div class="img_description">
                            <div class="img_rank"> 3 </div>
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>
                        </div>
                    </li>
                    <li class="prom_list" id="ex_prom_img_04">
                        <img src="/resources/user/resource/home/ex_prom_01.png">
                        <div class="img_description">
                            <div class="img_rank"> 4 </div>
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>
                        </div>


                    </li>
                    <li class="prom_list" id="ex_prom_img_05">
                        <img src="/resources/user/resource/home/ex_prom_02.png">
                        <div class="img_description">
                            <div class="img_rank"> 5 </div>
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>

                        </div>

                    </li>
                    <li class="prom_list" id="ex_prom_img_06">
                        <img src="/resources/user/resource/home/ex_prom_03.png">
                        <div class="img_description">
                            <div class="img_rank"> 6 </div>
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>
                        </div>
                    </li>
                </ul>
                <div class="btn_section">
                    <button type="button" class="prom_prev" onclick="setObj(this)" ><i class="fa-solid fa-angle-left"></i></button>
                    <button type="button" class="prom_next" onclick="setObj(this)"><i class="fa-solid fa-angle-right"></i></button>
                </div>
            </div>

            <div class="slide_section_m">
                <ul class="prom_box_m" id="ex_prom_m">
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_01.png">
                        <div class="description_m">
                            <div class="img_rank_m">1</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_02.png">
                        <div class="description_m">
                            <div class="img_rank_m">2</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_03.png">
                        <div class="description_m">
                            <div class="img_rank_m">3</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_01.png">
                        <div class="description_m">
                            <div class="img_rank_m">4</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_02.png">
                        <div class="description_m">
                            <div class="img_rank_m">5</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_03.png">
                        <div class="description_m">
                            <div class="img_rank_m">6</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                </ul>
                <div class="btn_section">
                    <button type="button" class="prom_prev" onclick="setObj(this)" ><i class="fa-solid fa-angle-left"></i></button>
                    <button type="button" class="prom_next" onclick="setObj(this)"><i class="fa-solid fa-angle-right"></i></button>
                </div>
                <div class="radio_section">
                    <input type="radio" id="ex_chk_01" name="ex_chk" checked="checked">
                    <input type="radio" id="ex_chk_02" name="ex_chk">
                    <input type="radio" id="ex_chk_03" name="ex_chk">
                    <input type="radio" id="ex_chk_04" name="ex_chk">
                    <input type="radio" id="ex_chk_05" name="ex_chk">
                    <input type="radio" id="ex_chk_06" name="ex_chk">
                </div>
            </div>


        </div>

        <div class="mu_promotion_section">
            <div class="section_name">
                <span class="section_title">NEW</span>
                <span class="prom_link"><a href="#">전 체 보 기</a></span>
            </div>

            <div class="section_page">
                <span id="mu_page_num">1</span><span>/2</span>
            </div>

            <div class="slide_section_pc">
                <ul class="prom_box" id="mu_prom">
                    <li class="prom_list" id="mu_prom_img_01">
                        <img src="/resources/user/resource/home/ex_prom_01.png">
                        <div class="img_description">
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>
                        </div>
                    </li>
                    <li class="prom_list" id="mu_prom_img_02">
                        <img src="/resources/user/resource/home/ex_prom_02.png">
                        <div class="img_description">
                            <div class="img_title"><a class="title_text" href="#">제목</a></div>
                            <div class="img_space"><a class="space_text" href="#">장소</a></div>
                            <div class="img_schedule"><a class="schedule_text" href="#">기간</a></div>
                        </div>
                    </li>
                    <li class="prom_list" id="mu_prom_img_03">
                        <img src="/resources/user/resource/home/ex_prom_03.png">
                        <a><div class="img_description">
                            <div class="img_title">제목</div>
                            <div class="img_space">장소</div>
                            <div class="img_schedule">일정</div>
                        </div></a>
                    </li>
                    <li class="prom_list" id="mu_prom_img_04">
                        <img src="/resources/user/resource/home/ex_prom_01.png">
                        <a><div class="img_description">
                            <div class="img_title">제목</div>
                            <div class="img_space">장소</div>
                            <div class="img_schedule">일정</div>
                        </div></a>
                    </li>
                    <li class="prom_list" id="mu_prom_img_05">
                        <img src="/resources/user/resource/home/ex_prom_02.png">
                        <a><div class="img_description">
                            <div class="img_title">제목</div>
                            <div class="img_space">장소</div>
                            <div class="img_schedule">일정</div>
                        </div></a>
                    </li>
                    <li class="prom_list" id="mu_prom_img_06">
                        <img src="/resources/user/resource/home/ex_prom_03.png">
                        <a><div class="img_description">
                            <div class="img_title">제목</div>
                            <div class="img_space">장소</div>
                            <div class="img_schedule">일정</div>
                        </div></a>
                    </li>
                </ul>
                <div class="btn_section">
                    <button type="button" class="prom_prev" onclick="setObj(this)" ><i class="fa-solid fa-angle-left"></i></button>
                    <button type="button" class="prom_next" onclick="setObj(this)"><i class="fa-solid fa-angle-right"></i></button>
                </div>
            </div>

            <div class="slide_section_m">
                <ul class="prom_box_m" id="mu_prom_m">
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_01.png">
                        <div class="description_m">
                            <div class="img_rank_m">1</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_02.png">
                        <div class="description_m">
                            <div class="img_rank_m">2</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_03.png">
                        <div class="description_m">
                            <div class="img_rank_m">3</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_01.png">
                        <div class="description_m">
                            <div class="img_rank_m">4</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_02.png">
                        <div class="description_m">
                            <div class="img_rank_m">5</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                    <li class="prom_list_m">
                        <img src="/resources/user/resource/home/event_img_03.png">
                        <div class="description_m">
                            <div class="img_rank_m">6</div>
                            <div class="img_title_m">제목</div>
                            <div class="img_schedule_m">기간</div>
                        </div>
                    </li>
                </ul>
                <div class="btn_section">
                    <button type="button" class="prom_prev" onclick="setObj(this)" ><i class="fa-solid fa-angle-left"></i></button>
                    <button type="button" class="prom_next" onclick="setObj(this)"><i class="fa-solid fa-angle-right"></i></button>
                </div>
                <div class="radio_section">
                    <input type="radio" id="mu_chk_01" name="mu_chk" checked="checked">
                    <input type="radio" id="mu_chk_02" name="mu_chk">
                    <input type="radio" id="mu_chk_03" name="mu_chk">
                    <input type="radio" id="mu_chk_04" name="mu_chk">
                    <input type="radio" id="mu_chk_05" name="mu_chk">
                    <input type="radio" id="mu_chk_06" name="mu_chk">
                </div>
            </div>

        </div>

        <div class="board_section">
            <div class="section_name">리뷰 게시판 </div>
            <ul class="board_box">
                <li class="board_list">
                    <div class="board_content">
                        <div class="board_img"><img src="/resources/user/resource/home/ex_prom_01.png"></div>
                        <div class="board_info">
                            <div class="board_row_1"> <%--게시물 제목 및 리뷰 스코어--%>
                                <div class="board_title">장막 너머의 외로움을 포착하다</div>
                                <div class="review_score_box">
                                    <div class="review_star"><i class="fa-solid fa-star"></i><span class="star_point">3.5</span></div>
                                    <div class="review_thumb"><i class="fa-solid fa-thumbs-up"></i><span class="thumb_point">21</span></div>
                                </div>
                            </div>
                            <div class="board_row_2"> <%--작품 이름 및 작가 이름--%>
                                <div class="row_content">
                                    <div class="span_head">[전시]</div><span class="product_title">사울레이터 창문을 통해 어림풋이</span>
                                </div>
                                <div class="row_content">
                                    <div class="span_head">작성자</div><div class="review_writer">아무개</div>
                                </div>
                            </div>
                            <div class="board_row_3"> <%--버튼 영역 --%>
                                <div class="direct_btn"><a class="link_pd" href="">상품 바로가기</a></div>
                                <div class="direct_btn"><a class="link_review" href="">리뷰 바로가기</a></div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="board_list">
                    <div class="board_content">
                        <div class="board_img"><img src="/resources/user/resource/home/ex_prom_01.png"></div>
                        <div class="board_info">
                            <div class="board_row_1"> <%--게시물 제목 및 리뷰 스코어--%>
                                <div class="board_title">장막 너머의 외로움을 포착하다</div>
                                <div class="review_score_box">
                                    <div class="review_star"><i class="fa-solid fa-star"></i><span class="star_point">3.5</span></div>
                                    <div class="review_thumb"><i class="fa-solid fa-thumbs-up"></i><span class="thumb_point">21</span></div>
                                </div>
                            </div>
                            <div class="board_row_2"> <%--작품 이름 및 작가 이름--%>
                                <div class="row_content">
                                    <div class="span_head">[전시]</div><span class="product_title">사울레이터 창문을 통해 어림풋이</span>
                                </div>
                                <div class="row_content">
                                    <div class="span_head">작성자</div><div class="review_writer">아무개</div>
                                </div>
                            </div>
                            <div class="board_row_3"> <%--버튼 영역 --%>
                                <div class="direct_btn">상품 바로가기</div>
                                <div class="direct_btn">리뷰 바로가기</div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="board_list">
                    <div class="board_content">
                        <div class="board_img"><img src="/resources/user/resource/home/ex_prom_01.png"></div>
                        <div class="board_info">
                            <div class="board_row_1"> <%--게시물 제목 및 리뷰 스코어--%>
                                <div class="board_title">장막 너머의 외로움을 포착하다</div>
                                <div class="review_score_box">
                                    <div class="review_star"><i class="fa-solid fa-star"></i><span class="star_point">3.5</span></div>
                                    <div class="review_thumb"><i class="fa-solid fa-thumbs-up"></i><span class="thumb_point">21</span></div>
                                </div>
                            </div>
                            <div class="board_row_2"> <%--작품 이름 및 작가 이름--%>
                                <div class="row_content">
                                    <div class="span_head">[전시]</div><span class="product_title">사울레이터 창문을 통해 어림풋이</span>
                                </div>
                                <div class="row_content">
                                    <div class="span_head">작성자</div><div class="review_writer">아무개
                                </div>
                                </div>
                            </div>
                            <div class="board_row_3"> <%--버튼 영역 --%>
                                <div class="direct_btn">상품 바로가기</div>
                                <div class="direct_btn">리뷰 바로가기</div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <div class="board_btn">
                <button type="button" id="review_prev" class="btn_prev"><i class="fa-solid fa-angle-left"></i></button>
                <button type="button" id="review_next" class="btn_next"><i class="fa-solid fa-angle-right"></i></button>
            </div>
        </div>

    </div>
</div>

</body>



<%--js  불러오기 --%>

    <script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
    <script src="/resources/common/js/common.js" type="text/javascript"></script>
    <script src="/resources/user/js/main_home.js" type="text/javascript"></script>
    <script src="/resources/user/js/main_board.js" type="text/javascript"></script>
    <script src="/resources/user/js/main_productMain.js" type="text/javascript"></script>



</html>