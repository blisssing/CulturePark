<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="myPage">

    <%--1.라벨--%>
    <div class="myPage_txt">MY PAGE</div>

        <p class="sectionLine"></p>

    <%--2.회원 등급--%>
    <div class="myInfo_txt">
        <div class="info_descript">
            <c:set var="name" value="${sessionScope.member.mb_name}" />
            <c:set var="grade" value="${sessionScope.member.mb_grade}" />

            <span class="myName">${name}</span> 님은 현재<br>
            <a href="/levelPage.do" class="grade" target="_blank">
            <c:set var="gradeText" value="${fn:split(grade,'_')}" />
                <c:set var="first" value="${gradeText[0]}"/>
                <c:set var="second" value="${gradeText[1]}"/>
                <c:set var="total_str" value="${first} ${second}"/>

            <div class="culture_level">${total_str}</div>
            </a>
            <span>회원입니다</span>
        </div>

        <div class="level_section">
            <div class="level_btn">
                <a href="/levelPage.do" id="level_label" target="_blank" alt="등급별 혜택">등급별 혜택</a>
            </div>
        </div>

    </div>

        <p class="sectionLine"></p>
        <%-- 3.적립금 영역 --%>
        <div class="saved_money">
            <span class="savedM_txt">적립금</span>

            <span class="savedM_btn">
                <a href="#고객센터_마이멤버십" target="_blank" alt="적립금">0</a>
            </span>
            <span class="p_label">p</span>
        </div> <%-- saved_money --%>
</div> <%-- myPage --%>


<%-- ----------- subMenu ----------%>

<div class="subMenu">
    <ul class="sub_section">
        <li><a class="subList" href="/myTicket.do">마이티켓</a></li>
        <li><a class="subList" href="/likeList.do">찜목록</a></li>
        <li><a class="subList" href="/myReview.do">마이리뷰</a></li>
        <li><a class="subList" href="/myInfo.do">회원정보</a></li>
        <li class="pc_none"><a class="subList" href="/logout.do">로그아웃</a></li>
    </ul>
</div> <%-- /subMenu --%>
