<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="/assets/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">


</head>
<body style="width:auto ;  font-family: 'Arial', sans-serif;" >
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div style="width: 84% ; float: right ;padding: 0rem 1rem 1rem 0rem">

    <div class="container" style="margin-top: 10px" >
    <form method="get" action="/khuyen-mai/bo-loc-km" class="filter-form">
        <div class="row">
            <div class="col-md-2">
                <label>Mã khuyến mại</label>
                <input value="${idKm}" name="idKm" class="form-control">
            </div>
            <div class="col-md-2">
                <label>Tên khuyến mại</label>
                <select id="tenKm" name="tenKm" class="form-control">
                    <option value="">--Tất cả--</option>
                    <c:forEach items="${listKmAll}" var="km">
                        <option  ${km.tenKhuyenMai == tenKm  ? 'selected' : ''}
                                value="${km.tenKhuyenMai}">${km.tenKhuyenMai}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <label>Loại khuyến mại</label>
                <select name="loaiKm" class="form-control">
                    <option value="">--Tất cả--</option>
                    <option  ${loaiKm == "product" ?'selected':'' } value="product">VNĐ</option>
                    <option ${loaiKm == "percentage" ?'selected':'' } value="percentage">%</option>
                </select>
            </div>
            <div class="col-md-3">
                <label>Giá trị</label>
                    <input value="${giaTri}"  name="giaTri" class="form-control">
            </div>
            <div class="col-md-2">
                <label>Trạng thái</label>
                <select name="trangThai" class="form-control">
                    <option value="">--Tất cả--</option>
                    <option ${trangThai == 1 ?'selected' :''} value="1">Còn hạn</option>
                    <option ${trangThai == 2 ?'selected' :''} value="2">Hết hạn</option>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <label>Ngày bắt đầu</label>
                <input type="date" value="${dateBd}" name="dateBd" class="form-control">

            </div>
            <div class="col-md-3">
                <label>Ngày kết thúc</label>
                <input type="date" value="${dateKt}" name="dateKt" class="form-control">
            </div>


        </div>
        <br>
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        <a class="btn btn-secondary ml-2" href="/khuyen-mai/hien-thi">Làm mới bộ lọc</a>
    </form>
    </div>
    <div class="container" style="margin-top: 20px">
        <h2 style="text-align: center ; font-weight: 600">Quản lý Khuyến mãi</h2>

        <!-- Nút để mở modal thêm mới khuyến mãi -->
            <form action="/khuyen-mai/form-add" method="get">
            <button type="submit" class="btn btn-dark">Thêm Mới Khuyến mãi</button>
            </form>


        <!-- Bảng hiển thị danh sách khuyến mãi -->
        <table class="table mt-3">
            <thead style="background: #b3b7bb;">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Tên khuyến mãi</th>
                <th scope="col">Giá trị giảm</th>
                <th scope="col">Ngày bắt đầu</th>
                <th scope="col">Ngày kết thúc</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Hành động</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listKm}" var="km">
            <tr>
                <th scope="row">${km.id}</th>
                <th scope="row">${km.tenKhuyenMai}</th>
                <th scope="row">${km.giaTri}
                    <c:if test="${km.loaiKhuyenMai == 'percentage'}">%</c:if>
                    <c:if test="${km.loaiKhuyenMai == 'product'}">VNĐ</c:if></th>
                <th scope="row" class="rawDate">${km.ngayBatDau}</th>
                <th scope="row" class="rawDate">${km.ngayKetThuc}</th>
                <th scope="row"><button type="button"  ${km.trangThai == 1 ? 'style="background: #34ce57"':'style="background: red"'} class="btn">${km.trangThai == 1 ? 'Còn hạn' :'Hết hạn ' }</button></th>
                <td>
                    <form action="/khuyen-mai/delete/${km.id}">
                    <button type="button"  class="detail-link btn btn-warning" data-id="${km.id}"> <i class="bi bi-pencil-square"></i></button>
                        <button type="submit" class="btn btn-secondary" onclick="confirmAction()" > <i class="fas fa-trash"></i></button>
                    </form>

                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${not empty page1 && not empty listKm}">
            <div style="display: flex; justify-content: space-between ; ">

                <div>
                    <c:if test="${page > 0}">
                        <button class="btn btn-outline-success" type="button"><a class="navbar-brand"
                                                                                 href="?page=${page - 1 }">Trang
                            truoc</a></button>
                    </c:if>
                </div>
                <div>
                    <c:if test="${ empty param.keyword}">
                        <c:forEach begin="0" end="${page1 - 1}" varStatus="i">
                            <button class="btn btn-outline-success"><a class="navbar-brand"
                                                                       href="/khuyen-mai/hien-thi?page=${i.index}">${i.index + 1}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                </div>


                <div>
                    <c:if test="${page < page1 - 1}">
                        <button class="btn btn-outline-success" type="submit"><a class="navbar-brand"
                                                                                 href="?page=${page + 1 }">Trang
                            sau</a></button>
                    </c:if>
                </div>
            </div>
        </c:if>


    </div>


    <!-- Modal chỉnh sửa khuyến mãi -->
    <div class="modal fade" id="editPromotionModal" tabindex="-1" aria-labelledby="editPromotionModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPromotionModalLabel">Chỉnh Sửa Khuyến mãi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="width: 100%">
                    <!-- Form chỉnh sửa khuyến mãi sẽ được đặt ở đây -->
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>


</div>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tenKm').select2();
    });
</script>
<script>
    var rawDateElements = document.getElementsByClassName('rawDate');

    // Lặp qua từng phần tử và thực hiện xử lý
    for (var i = 0; i < rawDateElements.length; i++) {
        var rawDate = rawDateElements[i].innerText;

        // Tạo một đối tượng Date từ chuỗi ngày tháng
        var dateObject = new Date(rawDate);

        // Định dạng ngày tháng và giờ
        var formattedDate = dateObject.toLocaleString('en-GB', {
            day: 'numeric',
            month: 'numeric',
            year: 'numeric',
        });

        rawDateElements[i].innerText = formattedDate;
    }

</script>
<!-- Dưới mã JavaScript hiện tại của bạn -->
<script>
    $(document).ready(function() {
        $('.detail-link').click(function(e) {
            e.preventDefault();
            var promotionId = $(this).data('id');

            // Gửi yêu cầu AJAX để lấy thông tin chi tiết
            $.ajax({
                type: 'GET',
                url: '/khuyen-mai/detail/' + promotionId,
                success: function(response) {
                    // Cập nhật nội dung modal với thông tin chi tiết
                    $('#editPromotionModal .modal-body').html(response);
                    $('#editPromotionModal').modal('show');
                },
                error: function(error) {
                    console.error('Error fetching promotion details:', error);
                }
            });
        });
    });
</script>

<style>
    th {
        display: table-cell;
        vertical-align: inherit;
        font-weight: initial;
    }

</style>
<script>
    function confirmAction() {
        var xacNhan = confirm("Bạn có chắc chắn muốn xóa khuyến mại này ?");
        if (xacNhan) {

        } else {
            // Nếu người dùng chọn "Cancel"
            event.preventDefault()
        }
    }
</script>

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
<style>
    /* Custom styles for the page */
    body {
        margin: 0;
        padding: 0;
        background-color: #f8f9fa; /* Set a background color */
    }

    .container {
        background-color: #ffffff; /* Set a white background for the container */
        border-radius: 8px; /* Add rounded corners to the container */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle box shadow */
        padding: 20px;
    }

    .btn-dark {
        background-color: #343a40; /* Dark background color for the "Thêm Mới Khuyến mãi" button */
        color: #ffffff; /* Text color for the button */
    }

    .table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }

    .table th, .table td {
        border: 1px solid #dee2e6;
        padding: 8px;
        text-align: center;
    }

    /* Styles for the modal */
    .modal-content {
        border-radius: 10px;
    }


</style>
</body>
</html>
