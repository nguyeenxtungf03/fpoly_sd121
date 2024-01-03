<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Charts - SB Admin</title>
    <link href="/assets/css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body style="width:auto ; font-weight: 600 ">
<div style="width: 16% ; float: right" >
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div style="width: 84% ; float: right ;padding: 1rem 1rem 1rem 0rem">
    <div class="container">


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 01 -->
<c:set var="totalQuantity1" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '01'}">
        <c:set var="totalQuantity1" value="${totalQuantity1 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 02 -->
<c:set var="totalQuantity2" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '02'}">
        <c:set var="totalQuantity2" value="${totalQuantity2 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 03 -->
<c:set var="totalQuantity3" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '03'}">
        <c:set var="totalQuantity3" value="${totalQuantity3 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 04 -->
<c:set var="totalQuantity4" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '04'}">
        <c:set var="totalQuantity4" value="${totalQuantity4 + hd.thanhTien}"/>
    </c:if>
</c:forEach>

<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 05 -->
<c:set var="totalQuantity5" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '05'}">
        <c:set var="totalQuantity5" value="${totalQuantity5 + hd.thanhTien}"/>
    </c:if>
</c:forEach>

<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 06 -->
<c:set var="totalQuantity6" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '06'}">
        <c:set var="totalQuantity6" value="${totalQuantity6 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 07 -->
<c:set var="totalQuantity7" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '07'}">
        <c:set var="totalQuantity7" value="${totalQuantity7 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 08 -->
<c:set var="totalQuantity8" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '08'}">
        <c:set var="totalQuantity8" value="${totalQuantity8 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 09 -->
<c:set var="totalQuantity9" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '09'}">
        <c:set var="totalQuantity9" value="${totalQuantity9 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 10 -->
<c:set var="totalQuantity10" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '10'}">
        <c:set var="totalQuantity10" value="${totalQuantity10 + hd.thanhTien}"/>
    </c:if>
</c:forEach>

<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 11 -->
<c:set var="totalQuantity11" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '11'}">
        <c:set var="totalQuantity11" value="${totalQuantity11 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<!-- Hiển thị thông tin của hóa đơn thỏa mãn điều kiện tháng 12 -->
<c:set var="totalQuantity12" value="0"/>
<c:forEach var="hd" items="${listHd1}">
    <c:if test="${fn:substring(hd.ngayTao, 5, 7) eq '12'}">
        <c:set var="totalQuantity12" value="${totalQuantity12 + hd.thanhTien}"/>
    </c:if>
</c:forEach>


<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="card bg-primary text-bg-light mb-4">
            <div class="card-body"><i class="bi bi-cash-coin"></i> Doanh Thu</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <div class="small text-white stretched-link">
                    <!-- Sử dụng forEach và EL để tính tổng soLuong -->
                    <c:set var="totalQuantityhd" value="0"/>
                    <c:forEach var="hd" items="${listHd1}">
                        <c:set var="totalQuantityhd" value="${totalQuantityhd + hd.thanhTien}"/>
                    </c:forEach>
                    Tổng số tiền <span style="font-weight: 400"> : <fmt:formatNumber value="${totalQuantityhd}"
                                                                                     pattern="##,###,###"></fmt:formatNumber> ₫
</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-warning text-bg-light mb-4">
            <div class="card-body"><i class="bi bi-receipt"></i> Số lượng đơn bán ra</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <div class="small text-white stretched-link">
                    Số hoá đơn : <span style="font-weight: 400"> ${fn:length(hoaDonDaBan)} </span><br>
                </div>
                <div class="small text-white">
                    <svg class="svg-inline--fa fa-angle-right" aria-hidden="true" focusable="false" data-prefix="fas"
                         data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"
                         data-fa-i2svg="">
                    </svg><!-- <i class="fas fa-angle-right"></i> Font Awesome fontawesome.com --></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success text-bg-light mb-4">
            <div class="card-body"><i class="bi bi-clipboard-pulse"></i> Số lượng sản phẩm đã bán</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <div class="small text-white stretched-link">
                    <c:set var="totalQuantitysp" value="0"/>
                    <c:forEach var="hdct" items="${listHdct}">
                        <c:set var="totalQuantitysp" value="${totalQuantitysp + hdct.soLuong}"/>
                    </c:forEach>
                    Số sản phẩm <span style="font-weight: 400"> : <fmt:formatNumber value="${totalQuantitysp}"
                                                                                    pattern="##,###,###"></fmt:formatNumber>
</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-danger text-bg-light mb-4">
            <div class="card-body"><i class="bi bi-people-fill"></i> Khách hàng đã mua</div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <div class="small text-white stretched-link">
                    Số khách hàng : <span style="font-weight: 400">${countUniqueCustomers}</span><br>
                </div>
                <div class="small text-white">
                    <svg class="svg-inline--fa fa-angle-right" aria-hidden="true" focusable="false" data-prefix="fas"
                         data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"
                         data-fa-i2svg="">
                    </svg><!-- <i class="fas fa-angle-right"></i> Font Awesome fontawesome.com --></div>
            </div>
        </div>
    </div>
</div>

<div id="layoutSidenav_content">
    <div class="card mb-4">
        <div class="card-header" style="display: flex ; align-items: center ;justify-content: space-between">
            <div>
                <form method="get" action="/hoa-don/searchTK " id="searchByDateForm"
                      style="display: flex; flex-direction: row; gap: 0.5rem ; height: 2rem ;align-items: center ">                <i class="fas fa-chart-area me-1"></i>

                    Thời gian từ <input type="date" name="dateBd" placeholder="Bắt đầu " aria-label="Search"
                                        style="width: 8rem" value="${param.dateBd}" required>
                    đến <input type="date" placeholder="Kết thúc " name="dateKt" aria-label="Search"
                               style="width: 8rem" value="${param.dateKt}" required>

                    <button style="" class="btn " type="submit"><i class="bi bi-search"></i></button>
                </form>
            </div>
            <div style="display: flex;flex-direction: row ; gap : 1rem;">
                <div>
                    <button onclick="openNewWindowKh()" class="btn btn-outline-success"><i class="bi bi-bar-chart-line"></i> Top 10 khách hàng tiềm năng
                    </button>
                </div>
                <div>
                    <button onclick="openNewWindowSp()" class="btn btn-outline-success"><i class="bi bi-bar-chart-line-fill"></i> Top 10 Sản phẩm bán chạy
                    </button>
                </div>
            </div>

            <div>
                <button class="btn btn-outline-success"><a class="navbar-brand" href="/hoa-don/thong-ke"><i class="fas fa-sync"></i> Load</a>
                </button>
            </div>

        </div>

        <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="38"></canvas>
        </div>
    </div>


</div>
</div>
</div>
<style>
    .btn-outline-success {
       color: black;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script>
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Area Chart Example
    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
            datasets: [{
                label: "Doanh thu ",
                lineTension: 0,
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 50,
                pointBorderWidth: 2,
                data: [${totalQuantity1}, ${totalQuantity2}, ${totalQuantity3}, ${totalQuantity4}, ${totalQuantity5}, ${totalQuantity6}, ${totalQuantity7}, ${totalQuantity8}, ${totalQuantity9}, ${totalQuantity10},
                    ${totalQuantity11}, ${totalQuantity12}

                ],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 8
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: ${ totalQuantity1 + totalQuantity2 + totalQuantity3 + totalQuantity4 +totalQuantity5 +totalQuantity6 +totalQuantity7 + totalQuantity8 +totalQuantity9 +totalQuantity10 +totalQuantity11 +totalQuantity12 + 120000},
                        maxTicksLimit: 12,
                        callback: function (value, index, values) {
                            return number_format(value) + ' ₫';
                        }
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)",
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                intersect: false,
                mode: 'index',
                caretPadding: 10,
                callbacks: {
                    label: function (tooltipItem, chart) {
                        var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' ₫';
                    }
                }
            }
        }
    });

    function number_format(number, decimals, dec_point, thousands_sep) {
        // *     example: number_format(1234.56, 2, ',', ' ');
        // *     return: '1 234,56'
        number = (number + '').replace(',', '').replace(' ', '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function (n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }
</script>

<script>
    function openNewWindowKh() {
        // Thay đổi URL của trang bạn muốn mở ở đây
        var newWindowUrl = 'http://localhost:8080/hoa-don/top10-kh';
        var windowWidth = 1000;
        var windowHeight = 500;

        // Tính toán vị trí giữa màn hình
        var left = (window.innerWidth - windowWidth) / 2;
        var top = (window.innerHeight - windowHeight) / 2;

        // Các tùy chọn cho cửa sổ mới
        var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight + ',top=' + top + ',left=' + left;

        // Mở cửa sổ mới với các tùy chọn
        window.open(newWindowUrl, '_blank', windowFeatures);
    }

    function openNewWindowSp() {
        // Thay đổi URL của trang bạn muốn mở ở đây
        var newWindowUrl = 'http://localhost:8080/hoa-don/top10-sp';
        var windowWidth = 1000;
        var windowHeight = 500;

        // Tính toán vị trí giữa màn hình
        var left = (window.innerWidth - windowWidth) / 2;
        var top = (window.innerHeight - windowHeight) / 2;

        // Các tùy chọn cho cửa sổ mới
        var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight + ',top=' + top + ',left=' + left;

        // Mở cửa sổ mới với các tùy chọn
        window.open(newWindowUrl, '_blank', windowFeatures);
    }

</script>
<style>

    .container {
        background-color: #ffffff;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        padding: 30px;
        border-radius: 10px;
    }
</style>


</body>
</html>
