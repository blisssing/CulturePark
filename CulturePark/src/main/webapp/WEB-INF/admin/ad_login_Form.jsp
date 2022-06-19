<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <style><%@include file="/resources/common/css/fontawesome/all.min.css"%></style>
    <!-- Custom styles for this template-->
    <style><%@include file="/resources/common/css/sb-admin-2.min.css"%></style>

    <title>CulturePar 관리자 - Login</title>

    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
</head>

<body class="bg-gradient-primary">

<div class="container">

    <c:set var="result" value="${param.result}"></c:set>

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">CulturePark 관리자 모드</h1>
                                </div>
                                <form id="frm" class="user" method="post">
                                    <div class="form-group">
                                        <input type="email" name="ad_email" class="form-control form-control-user"
                                               id="exampleInputEmail" aria-describedby="emailHelp"
                                               placeholder="이메일을 입력하시오">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="ad_pw" class="form-control form-control-user"
                                               id="exampleInputPassword" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <c:choose>
                                            <c:when test="${result=='loginFailed'}">
                                                <label style="color: red; font-size: 0.8rem; margin-left: 10px;" >로그인에 실패하였습니다</label>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <button class="btn_login btn btn-primary btn-user btn-block" type="button">
                                        Login
                                    </button>

                                </form>
                                <hr>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="/resources/common/js/bootstrap/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/common/js/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/common/js/common/sb-admin-2.min.js"></script>
<script src="/resources/admin/js/ad_login.js"></script>


</body>

</html>