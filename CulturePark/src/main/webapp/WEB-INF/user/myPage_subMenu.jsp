<%@ page pageEncoding="UTF-8" %>

<%-- ----------myPage---------- --%>
<div class="myPage">

    <%--1.라벨--%>
    <div class="myPage_txt">MY PAGE</div>

        <div class="sectionLine"></div>

    <%--2.회원 등급--%>
    <div class="myInfo_txt">
        <span class="myName">김진아</span> 님은 현재<br>
        <a href="#현재등급정보+다음등급까지의게이지" class="grade" target="_blank">
            <div class="culture_beginner">Culture Beginner</div>
        </a>
        <span>회원입니다</span>
    </div>


<div class="sectionLine"></div>

    <div class="level_btn">
        <a href="#고객센터_마이멤버십" id="level_label" target="_blank" alt="등급별 혜택">등급별 혜택</a>
    </div>



<div class="sectionLine"></div>
    <%-- 3.적립금 영역 --%>
    <div class="saved_money">
        <span class="savedM_txt">적립금</span>

        <span class="savedM_btn">
            <a href="#고객센터_마이멤버십" target="_blank" alt="적립금">0</a></span></span>
        <span class="p_label">p</span>

    </div> <%-- saved_money --%>
</div> <%-- myPage --%>

<%-- ----------- subMenu -------- --%>


<div class="subMenu">
    <ul class="sub_section">
        <li><a class="subList" href="#">마이티켓</a></li>
        <li><a class="subList" href="#">찜목록</a></li>
        <li><a class="subList" href="#">마이리뷰</a></li>
        <li><a class="subList" href="#">회원정보</a></li>
    </ul>
</div> <%-- /subMenu --%>