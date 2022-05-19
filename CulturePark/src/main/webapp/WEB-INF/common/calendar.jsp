<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body onload="autoReload();">
<table align="center" id="calendar">
    <tr>
        <td>
            <a id="before" href="javascript:beforem()"></a>
        </td>
        <td colspan="4" align="center">
            <div id="yearmonth"></div>
        </td>
        <td>
            <a id="next" href="javascript:nextm()"></a>
        </td>
        <td>
            <a href="javascript:thisMonth()">오늘</a>
        </td>
    </tr>
    <tr>
        <td width="14%"> 월 </td>
        <td width="14%"> 화 </td>
        <td width="14%"> 수 </td>
        <td width="14%"> 목 </td>
        <td width="14%"> 금 </td>
        <td width="14%"><font color="#009de0">토</font></td>
        <td width="14%"><font color="#ed5353">일</font></td>
    </tr>
</table>
</body>

<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="/resources/common/js/common.js" type="text/javascript"></script>
<script src="/resources/user/js/pd_board.js" type="text/javascript"></script>
<script src="/resources/common/js/calendar.js" type="text/javascript"></script>


</html>
