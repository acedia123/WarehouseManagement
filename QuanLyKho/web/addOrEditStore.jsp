<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <!-- META ============================================= -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no">
        <!-- FAVICONS ICON ============================================= -->
        <!--<link rel="icon" href="../error-404.html" type="image/x-icon" />-->
        <!--<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />-->
        <!-- PAGE TITLE HERE ============================================= -->
        <title>Quản Lý Kho</title>
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
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <%@ include file="layouts/header.jsp" %>
        <%@ include file="layouts/sidebar.jsp" %>

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">${param.id != null ?"Cập nhật kho" :"Thêm Kho"}</h4>
                    <ul class="db-breadcrumb-list">
                        <li>
                            <a href="./home.jsp"><i class="fa fa-home"></i>Trang chủ</a>
                        </li>
                        <li>
                            <a href="./ds-kho"><i class="fa fa-list"></i>Danh sách kho</a>
                        </li>
                        <li>${param.id != null ?"Cập nhật kho" :"Thêm Kho"}</li>
                    </ul>
                </div>	
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">
                            <div class="wc-title">
                                <h4>${param.id != null ?"Cập nhật kho" :"Thêm Kho"}</h4>
                            </div>
                            <div class="widget-inner">
                                <div id="errorMessage" class="d-none alert alert-danger" role="alert"></div>
                                <form id="storeForm" class="edit-profile m-b30">
                                    <c:if test="${param.id != null}">
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Mã kho</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${Store.getMaKho()}" hidden type="text" name="id">
                                                <input class="form-control" value="${Store.getMaKho()}" readonly type="text" name="id" id="storeCode">
                                            </div>
                                        </div>   
                                    </c:if>

                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Tên kho</label>
                                        <div class="col-sm-7">
                                            <input class="form-control" value="${Store.getTenKho()}" type="text" name="name" id="storeName" placeholder="Nhập tên kho">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Địa chỉ</label>
                                        <div class="col-sm-7">
                                            <input class="form-control" value="${Store.getDiaChi()}" name="address" type="text" id="storeAddress" placeholder="Nhập địa chỉ">
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <div class="row">
                                                <div class="col-sm-2">
                                                </div>
                                                <div class="col-sm-7">
                                                    <button type="submit" class="btn">Lưu</button>
                                                    <button type="reset" class="btn-secondry">Quay lại</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='assets/vendors/scroll/scrollbar.min.js'></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/vendors/chart/chart.min.js"></script>
        <script src="assets/js/admin.js"></script>
        <script src='assets/vendors/calendar/moment.min.js'></script>        
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

        <script>
            $('#storeForm').submit((e) => {
                e.preventDefault();
                const id = $("#storeCode").val();
                const name = $("#storeName").val();
                const address = $("#storeAddress").val();
                console.log(id, name, address);
                let message = [];
                if (name === '') {
                    message.push('Tên kho');
                }
                if (address === '') {
                    message.push('Địa chỉ');
                }
                if ($('#errorMessage').hasClass('d-none')) {
                    $('#errorMessage').toggleClass('d-none d-block');
                }
                if (name !== '' && address !== '') {
                    $('#errorMessage').toggleClass('d-block d-none');
                }
                $('#errorMessage').html(message.length > 0 ? message.join(', ') + ' không được để trống' : '');
                $.ajax({
                    url: "./AOUStore",
                    type: "POST",
                    data: {id, name, address},
                    success: (res) => {
                        const data = res.split('-');
                        console.log();
                        if (JSON.parse(data[1])) {
                            toastr.success(data[0], 'Thành công', {timeOut: 1000});
                            setTimeout(() => {
                                window.location.href = './ds-kho';
                            }, 1000);
                        } else {
                            toastr.error(data[0], 'Thất bại', {timeOut: 1000});
                        }
                    },
                    error: (err) => {
                        console.log(err);
                    }
                });
            });
        </script>
    </body>
</html>
