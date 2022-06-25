<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

    <title>CulturePar 판매자 - Login</title>

    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
</head>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row" style="justify-content: center">
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Culture Park</h1>
                                </div>
                                <form class="user">
                                    <div class="form-group">
                                        <div class="form-group row">
                                            <div class="col-sm-6 mb-3 mb-sm-0">
                                                <input name="loginType" type="radio" value="partner">
                                                <span class="context_head">파트너 계정</span>
                                            </div>
                                            <div class="col-sm-6">
                                                <input name="loginType" type="radio" value="manager">
                                                <span class="context_head">매니저 계정</span>
                                            </div>
                                        </div>
                                        <input type="email" class="form-control form-control-user"
                                               id="InputEmail" aria-describedby="emailHelp"
                                               placeholder="Enter Email Address...">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="InputPassword" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <div class="form-control form-control-user" id="message">

                                        </div>
                                    </div>

                                    <button type="button" class="login_btn btn btn-primary btn-user btn-block">
                                        Login
                                    </button>

                                    <hr>

                                    <div class="text-center">
                                        <a class="small" href="/findId.mdo">Forgot Id?</a>
                                    </div>

                                    <div class="text-center">
                                        <a class="small" href="/findPw.mdo">Forgot Password?</a>
                                    </div>



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
<script src="/resources/manager/js/m_login.js"></script>

</body>

</html>