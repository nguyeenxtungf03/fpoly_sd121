<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="myForm" action="/khuyen-mai/update/${km.id}" method="post" onsubmit="return validateDateRange()">
    <div class="form-column">
        <div class="col-md-12 mb-3" style="text-align: center; font-weight:600;"> Cập nhật khuyến mại</div>
        <div class="col-md-12 mb-3">
            <label for="productName">Tên khuyến mại</label>
            <input name="tenKhuyenMai" value="${km.tenKhuyenMai}" type="text" class="form-control" id="productName"
                   required>
        </div>
        <div class="col-md-12 mb-3">
                  <span style="display: none; gap : 10px; flex-direction: row;">
                      Loại Khuyến Mại :
                      <input  ${km.loaiKhuyenMai == "product" ?  'checked' :''}
                             type="radio"
                             name="loaiKhuyenMai" onclick="limitPercentage()"
                             value="product">VNĐ
                      <input style="margin-left: 20px;"
                             type="radio" ${km.loaiKhuyenMai == "percentage" ?  'checked' :''}
                             name="loaiKhuyenMai" onclick="limitPercentage()"
                             value="percentage">%</span>
        </div>
        <label class="mb-2" style="color: green; font-weight: bolder">Giá Trị Khuyến Mại: ${km.giaTri}<c:if test="${km.loaiKhuyenMai == 'product'}" > VNĐ</c:if> <c:if test="${km.loaiKhuyenMai == 'percentage'}" > %</c:if></label>
        <div class="col-md-12 mb-3" style="display: none">

            <input value="${km.giaTri}" name="giaTri" type="number" min="1" max="10000000" class="form-control" id="discountValue"
                   required>
        </div>
        <div class="col-md-12 mb-3">
            <label for="discountValue">Ngày bắt đầu</label>
            <input type="date" id="startDate" value="${km.ngayBatDau}" name="ngayBatDau" class="form-control" required>
        </div>
        <div class="col-md-12 mb-3">
            <label for="discountValue">Ngày kết thúc</label>
            <input type="date" id="endDate" value="${km.ngayKetThuc}" name="ngayKetThuc" class="form-control" required>
        </div>
    </div>

    <div class="col-md-12 mb-3" style="text-align: center; font-weight:600;">
        <c:if test="${newDate < km.ngayKetThuc}">
            <button class="btn btn-primary " type="submit">Cập nhật</button>
        </c:if>
        <c:if test="${newDate > km.ngayKetThuc}">
            <span style="color: red"> * Chú ý : Khuyến mại đã hết hạn không thể cập nhật !</span>
        </c:if>
    </div>
</form>
<c:if test="${newDate < km.ngayKetThuc}">
<table class="table table-hover">
    <tdead style = "color: white">
        <tr style="background: #5c636a ">
            <td style="color: white" scope="col"> Ảnh</td>
            <td style="color: white" scope="col">Tên sản phẩm</td>
            <td style="color: white" scope="col"> Giá bán</td>
            <td style="color: white" scope="col"> Số lượng</td>
            <td style="color: white" scope="col"> Trạng thái</td>
            <td style="color: white" scope="col"> Chức năng</td>
        </tr>
    </tdead>
    <tbody>
    <c:forEach items="${dsSpctKm}" var="spct">
    <tr>
        <td scope="row"><a href="/san-pham-chi-tiet/detail/${spct.id}"><img style="width: 3rem ;height: 4rem"
                                                                            src="../../../assets/images/imgSp/${spct.anhSanPham}"></a>
        <td scope="row">${spct.idSanPham.tenSanPham} <br> [ ${spct.idMauSac.tenMauSac} - ${spct.idKichThuoc.tenKichThuoc} ]</td>
        <td scope="row"><fmt:formatNumber>${spct.giaBan}</fmt:formatNumber></td>
        <td scope="row"><fmt:formatNumber>${spct.soLuong}</fmt:formatNumber></td>
        <td scope="row">${spct.trangThai == 0 ? 'Hoạt động' :'Không hoạt động'}</td>
        </td>
        <td>
            <form action="/khuyen-mai/deleteKmSp/${spct.id}" method="post">
                <button  class="btn btn-primary " style="background: red" type="submit">Xoá</button>
            </form>
        </td>

    </tr>
    </c:forEach>
</table>
    <c:if test="${ empty dsSpctKm}">
        <p style="text-align: center ; color: red">Sản phẩm hết khuyến mại hoặc đã cập nhật khuyến mại mới !</p>
    </c:if>
</c:if>


<!-- Include thư viện SweetAlert2 (đặt trước mã JavaScript của bạn) -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<script>
    // Kiểm tra radio button và áp dụng giới hạn giá trị
    function limitPercentage() {
        var discountInput = document.getElementById('discountValue');
        var vndRadio = document.querySelector('input[name="loaiKhuyenMai"][value="product"]');
        var percentageRadio = document.querySelector('input[name="loaiKhuyenMai"][value="percentage"]');

        if (vndRadio.checked) {
            discountInput.max = null;
        } else if (percentageRadio.checked) {
            discountInput.max = 100;
        }
    }
</script><script>
    function validateDateRange() {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        var currentDate = new Date();

        // Đặt tất cả các thành phần giờ, phút, giây, và mili giây về 0
        startDate = new Date(startDate);
        endDate = new Date(endDate);
        currentDate.setHours(0, 0, 0, 0);

        if (startDate >= endDate) {
            // Sử dụng SweetAlert2 để hiển thị thông báo và tự động đóng sau 1 giây
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            return false; // Ngăn chặn việc submit form
        } else if (startDate <= currentDate) {
            // Sử dụng SweetAlert2 để hiển thị thông báo và tự động đóng sau 1 giây
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Ngày bắt đầu phải lớn hơn ngày hiện tại',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            return false; // Ngăn chặn việc submit form
        } else {
            // Sử dụng SweetAlert2 để hiển thị thông báo thành công và tự động đóng sau 1 giây
            Swal.fire({
                icon: 'success',
                title: 'Thành công',
                text: 'Cập nhật thành công',
                timer: 1000, // 1 giây
                showConfirmButton: false,
            });
            setTimeout(() => {
                submitForm();
            }, 1200);
            return false; // Thay đổi thành false để không submit form ngay lập tức
        }
    }

    function submitForm() {
        // Thực hiện hành động submit form
        document.getElementById('myForm').submit();
    }

</script>

</body>
</html>
