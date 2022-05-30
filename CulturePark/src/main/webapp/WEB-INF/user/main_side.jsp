<%@ page pageEncoding="UTF-8" %>
<meta charset="utf-8">

<div class="sideMenu_pc">
    <ul class="side_section">
        <li class="sideList"><a href="/home.do">홈</a></li>
        <li class="sideList"><a href="/exhibitMain.do">전시</a></li>
        <li class="sideList"><a href="/museumMain.do">뮤지엄</a></li>
        <li class="sideList"><a href="/rankPage.do">랭킹</a></li>
        <li class="sideList"><a href="/reviewPage.do">리뷰 게시판</a></li>
        <li class="sideList"><a href="/servicePage.do">고객센터</a></li>
    </ul>
</div>


<div class="sideMenu_mobile">
    <%--    <div class="funcs_mobile">--%>
    <%--        <button type="button" class="toggle_btn" id="close_btn"><i class="fa-solid fa-xmark"></i></button>--%>
    <%--    </div>--%>
    <ul class="side_section_m">
        <div class="funcs_mobile"><button type="button" class="sideMenu_close_btn"><i class="fa-solid fa-xmark"></i></button></div>
        <li class="sideList_m"><a href="/exhibitMain.do">전시</a></li>
        <li class="sideList_m"><a href="/museumMain.do">뮤지엄</a></li>
        <li class="sideList_m"><a href="/rankPage.do">랭킹</a></li>
        <li class="sideList_m"><a href="/reviewPage.do">리뷰 게시판</a></li>
        <li class="sideList_m"><a href="/servicePage.do">고객센터</a></li>
    </ul>
    <div class="footerContainer">
        <%@include file="main_footer.jsp"%>
    </div>
</div>


<div class="myMenu_mobile">
    <ul class="my_section_m">
        <div class="my_funcs_mobile"><button type="button" class="my_close_btn"><i class="fa-solid fa-xmark"></i></button></div>
        <div class="memberInfo_wrap"><a href="" class="member_info">김진아 님</a></div>
        <li class="my_sideList"><a href="#">내 정보</a></li>
        <li class="my_sideList"><a href="/myTicket.do">마이티켓</a></li>
        <li class="my_sideList"><a href="/likeList.do">찜목록</a></li>
        <li class="my_sideList"><a href="/myReview.do">마이리뷰</a></li>
    </ul>
</div>