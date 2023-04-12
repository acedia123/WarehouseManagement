<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no">
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
        <title>Danh sách kệ hàng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/calendar/fullcalendar.css">
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
        <link rel="stylesheet" type="text/css" href="assets/css/custom.css">
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <%@ include file="layouts/header.jsp" %>
        <%@ include file="layouts/sidebar.jsp" %>
        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title">Quản Lý Kệ Hàng</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="./home.jsp"><i class="fa fa-home"></i>Trang chủ</a></li>
                        <li>Quản Lý Kệ Hàng</li>
                    </ul>
                </div>	
                <div class="mb-3 ${message.getStatus() ? "text-success": "text-danger"}">${message.getName()}</div>
                <div class="mb-3 d-flex align-items-center justify-content-between">
                    <a href="./AOUKe" class="btn btn-primary">Thêm kệ hàng mới</a>
                    <form class="form-inline">
                        <input class="form-control" value="${param.search}" name="search" type="search" placeholder="Tìm kiếm theo tên">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>

                <!-- Card -->
                <div class="row">
                    <c:forEach items="${listKe}" var="k">
                        <div class="col-md-6 col-lg-4 col-xl-4 col-sm-6 col-12">
                            <div class="widget-card card-bg">					 
                                <a href="/" class="wc-item d-flex justify-content-between">
                                    <div class="flex-grow-1">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-${k.getTrangThai() == 0 ? "success": "danger"} circle-status mr-2"></div>
                                            <span class="normal-text font-weight-bold">${k.getTrangThai() == 0 ? "Trống": "Đã đầy"}</span>
                                        </div>
                                        <div class="mt-3 d-flex align-items-center justify-content-between">
                                            <span class="normal-text-title">Kích thước:</span>
                                            <span class="normal-text font-weight-bold">${k.getKichCo()}</span>
                                        </div>
                                        <div class="mt-3 d-flex align-items-center justify-content-between">
                                            <div>
                                                <span class="normal-text-title">Tên kệ:</span>
                                                <div class="normal-text font-weight-bold">${k.getTenKe()}</div>
                                            </div>
                                            <div>
                                                <span class="normal-text-title">Vị trí</span>
                                                <div class="normal-text font-weight-bold">NUM-6</div>
                                            </div>
                                        </div>
                                        <div class="mt-3 d-flex align-items-center justify-content-between">
                                            <div>
                                                <span class="normal-text-title">Mã kệ:</span>
                                                <div class="normal-text font-weight-bold">${k.getMaKe()}</div>
                                            </div>
                                            <div>
                                                <span class="normal-text-title">Khu vực</span>
                                                <div class="normal-text font-weight-bold">AREA-A</div>
                                            </div>
                                        </div>
                                        <div class="mt-3">
                                            <span class="normal-text-title">Tên kho:</span>
                                            <div class="normal-text font-weight-bold">${k.getStore().getTenKho()}</div>
                                        </div>
                                    </div>
                                    <div class="ml-3">
                                        <img src="./assets/images/Layer 3.png" alt="alt"/>
                                    </div>
                                </a>				      
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <!-- Card END -->
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
    </body>
</html>
