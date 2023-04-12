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
        <title>Danh sách sản phẩm</title>
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
                    <h4 class="breadcrumb-title">Quản Lý Sản Phẩm</h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="./home.jsp"><i class="fa fa-home"></i>Trang chủ</a></li>
                        <li>Quản Lý Sản Phẩm</li>
                    </ul>
                </div>	
                <div class="mb-3 ${message.getStatus() ? "text-success": "text-danger"}">${message.getName()}</div>
                <div class="mb-3 d-flex align-items-center justify-content-between">
                    <a href="./addOrEditStore.jsp" class="btn btn-primary">Thêm sản phẩm mới</a>
                    <form class="form-inline">
                        <input class="form-control" value="${param.search}" name="search" type="search" placeholder="Tìm kiếm theo tên">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr class="table-primary">
                            <th scope="col">STT</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Số đăng kí</th>
                            <th scope="col">Kích cỡ</th>
                            <th scope="col">Số lượng tồn</th>
                            <th scope="col">Giá nhập</th>
                            <th scope="col">Giá bán</th>
                            <th scope="col">Đơn vị</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${listSP.size() == 0}">
                            <tr>
                                <td colspan="4" class="text-center">Không có dữ liệu</td>
                            </tr>
                        </c:if>
                        <c:if test="${listSP.size() > 0}">
                            <c:forEach items="${listSP}" var="o">
                                <tr>
                                    <th class="align-middle" scope="row">${o.getMaSanPham()}</th>
                                    <td class="align-middle">${o.getTenSanPham()}</td>
                                    <td class="align-middle">${o.getSoDangKi()}</td>
                                    <td class="align-middle">${o.getKichCo()}</td>
                                    <td class="align-middle">${o.getSoLuongTon()}</td>
                                    <td class="align-middle">${o.getGiaNhap()}</td>
                                    <td class="align-middle">${o.getGiaBan()}</td>
                                    <td class="align-middle">${o.getDonVi()}</td>
                                    <td class="align-middle">
                                        <span class="btn button-sm ${o.getTrangThai() == "1" ? "green":"red"}">${o.getTrangThai() == "1" ? "Hoạt động":"Không hoạt động"}</span>
                                    </td>
                                    <td class="align-middle d-flex">
                                        <a href="./AOUStore?id=${o.getMaSanPham()}" class="table-icon-btn">
                                            <i class="fa fa-pencil text-primary"></i>
                                        </a>
                                        <a href="/" class="ml-2 table-icon-btn">
                                            <i class="fa fa-trash text-danger"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
                <c:if test="${listSP.size() > 0}">
                    <nav>
                        <ul class="pagination d-flex justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="${index==1?"#":"ds-kho?index=1"}">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${numpage}" var="i">
                                <c:if test="${index==i}">
                                    <li class="page-item">
                                        <a class="page-link page-link--active" href="ds-kho?index=${i}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${index!=i}">
                                    <li class="page-item">
                                        <a class="page-link" href="ds-kho?index=${i}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="${index == numpage?"#":"ds-kho?index=3"}">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
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
