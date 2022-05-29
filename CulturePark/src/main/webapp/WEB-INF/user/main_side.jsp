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
        <div class="funcs_mobile"><button type="button" class="close_btn"><i class="fa-solid fa-xmark"></i></button></div>
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