<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <!-- META ============================================= -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
    <!-- FAVICONS ICON ============================================= -->
    <!--<link rel="icon" href="../error-404.html" type="image/x-icon" />-->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <!-- PAGE TITLE HERE ============================================= -->
    <title>Đăng nhập</title>
    <!-- MOBILE SPECIFIC ============================================= -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- All PLUGINS CSS ============================================= -->
    <link rel="stylesheet" type="text/css" href="assets/css/assets.css">
    <link rel="stylesheet" type="text/css" href="assets/vendors/calendar/fullcalendar.css">
    <!-- TYPOGRAPHY ============================================= -->
    <link rel="stylesheet" type="text/css" href="assets/css/typography.css">
    <!-- SHORTCODES ============================================= -->
    <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">
    <!-- STYLESHEETS ============================================= -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/dashboard.css">
    <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
    <link rel="stylesheet" type="text/css" href="assets/css/custom.css">
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <style>
        body{
            background:rgba(0, 0, 0, 0.76);
        }
        .login-app{
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
    </style>
</head>

<body>
    <div class="login-app">
        <div class="container">
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="first" class="card">
                        <div class="card-body form">
                            <div class="logo text-center">
                                <h1>Đăng nhập</h1>
                            </div>
                            <form class="m-0" action="login" method="POST" name="login">
                                <c:if test="${loginFail != null}">
                                    <div id="errorMessage" class="alert alert-danger" role="alert">${loginFail}</div>
                                </c:if>
                                <div class="form-group">
                                    <label for="inputUsername">Tên đăng nhập</label>
                                    <input type="text" name="username" class="form-control" id="email" placeholder="Nhập tên đăng nhập">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mật khẩu</label>
                                    <input type="password" name="password" id="password"  class="form-control" placeholder="Nhập mật khẩu">
                                </div>
                                <div class="form-group mb-2">
                                    <button type="submit" class="btn btn-primary w-100 text-uppercase">Đăng nhập</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</div>
<script>
    $("#signup").click(function () {
        $("#first").fadeOut("fast", function () {
            $("#second").fadeIn("fast");
        });
    });

    $("#signin").click(function () {
        $("#second").fadeOut("fast", function () {
            $("#first").fadeIn("fast");
        });
    });



    $(function () {
        $("form[name='login']").validate({
            rules: {

                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,

                }
            },
            messages: {
                email: "Please enter a valid email address",

                password: {
                    required: "Please enter password",

                }

            },
            submitHandler: function (form) {
                form.submit();
            }
        });
    });



    $(function () {

        $("form[name='registration']").validate({
            rules: {
                firstname: "required",
                lastname: "required",
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 5
                }
            },

            messages: {
                firstname: "Please enter your firstname",
                lastname: "Please enter your lastname",
                password: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 5 characters long"
                },
                email: "Please enter a valid email address"
            },

            submitHandler: function (form) {
                form.submit();
            }
        });
    });
</script>
</body>