<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="/assets/css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</head>
<body>
<div style="width: 16% ; float: right">
    <jsp:include page="../menu/menu.jsp"></jsp:include>
</div>
<div class="capNhat" style="width: 85% ; float: right ">
    <a href="/san-pham-chi-tiet/index?idSanPham=${spct.idSanPham.id}&idLsp=${spct.idLoaiSanPham.id}&idTh=${spct.idThuongHieu.id}&idCl=${spct.idChatLieu.id}" style="text-decoration: none ;color: black "> ↩
        Danh sách sản phẩm chi tiết </a> <br>
    <h2 style="text-align: center ; margin-top: 20px">Cập nhât sản phẩm chi tiết </h2>

    <p style="color: red">${error}</p>
    <p style="color: #1c7430">${pass}</p>
    <form method="post" enctype="multipart/form-data" action="/san-pham-chi-tiet/update/${spct.id}" class="filter-form">
        <div class="row">
            <div class="col-md-5">
                <label>Sản phẩm</label>
                <select id="idSanPham" name="idSanPham" class="form-control">

                    <c:forEach items="${listSp}" var="sp">
                        <option ${spct.idSanPham.tenSanPham == sp.tenSanPham ? 'selected' : ''}
                                value="${sp.id}">${sp.tenSanPham}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <label>Màu sắc</label>
                <select id="idMauSac" name="idMauSac" class="form-control">

                    <c:forEach items="${listMs}" var="ms">
                        <option ${spct.idMauSac.tenMauSac == ms.tenMauSac ? 'selected' : ''}
                                value="${ms.id}">${ms.tenMauSac}</option>
                    </c:forEach> </select>
            </div>
            <div class="col-md-2">
                <label>Kích Thước</label>
                <select id="idKichThuoc" name="idKichThuoc" class="form-control">

                    <c:forEach items="${listKt}" var="sp">
                        <option ${spct.idKichThuoc.tenKichThuoc == sp.tenKichThuoc ? 'selected' : ''}
                                value="${sp.id}">${sp.tenKichThuoc}</option>
                    </c:forEach> </select>
            </div>

        </div>
        <div class="row">
            <div class="col-md-3">
                <label>Loại sản phẩm</label>
                <select id="idLoaiSanPham" name="idLoaiSanPham" class="form-control">
                    <c:forEach items="${listLsp}" var="sp">
                        <option  ${spct.idLoaiSanPham.tenLoai == sp.tenLoai ? 'selected' : ''}
                                value="${sp.id}">${sp.tenLoai}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-3">
                <label>Thương hiệu</label>
                <select id="idThuongHieu" name="idThuongHieu" class="form-control">

                    <c:forEach items="${listTh}" var="sp">
                        <option  ${spct.idThuongHieu.tenThuongHieu == sp.tenThuongHieu ? 'selected' : ''}
                                value="${sp.id}">${sp.tenThuongHieu}</option>
                    </c:forEach> </select>
            </div>
            <div class="col-md-3">
                <label>Chất liệu</label>
                <select id="idChatLieu" name="idChatLieu" class="form-control">
                    <c:forEach items="${listCl}" var="sp">
                        <option ${spct.idChatLieu.tenChatLieu == sp.tenChatLieu ? 'selected' : ''}
                                value="${sp.id}">${sp.tenChatLieu}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <label for="minPrice">Giá bán</label>
                    <div class="input-group">
                        <input name="giaBan" required value="${spct.giaBan}" type="number" class="form-control" id="minPrice"
                               placeholder="Giá bán " min="1">
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label for="minPrice">Số lượng</label>
                    <div class="input-group">
                        <input name="soLuong" required value="${spct.soLuong}" type="number" class="form-control" id="minPrice"
                               placeholder="Số lượng " min="1">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <label for="minPrice">Mô tả</label>
                    <div class="input-group">
                        <textarea name="moTa" required type="number" class="form-control">${spct.moTa}</textarea>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <label>Trạng thái</label>
                <select name="trangThai" class="form-control">
                    <option   ${spct.trangThai == 0 ? 'selected':''} value="0">Hoạt động</option>
                    <option ${spct.trangThai == 1 ? 'selected':''} value="1">Không hoạt động</option>
                </select>
            </div>
        </div>
        <div class="col-md-2">
            <input type="hidden" name="anhSanPham" value="${spct.anhSanPham}" class="form-control">
            <input type="hidden" name="idKhuyenMai" value="${spct.idKhuyenMai.id}" class="form-control">
        </div>
        <div class="col-md-2" style="padding-top: 5px">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </div>
    </form>


</div>

<div class="fixed-top-right " style="width: 300px ;padding: 60px 60px 0px 0px">
    <div class="col-md-12" >
        <form style=" box-shadow: 0 0 4px 6px rgba(0, 0, 0, 0.1);" class="row needs-validation" novalidate method="post" enctype="multipart/form-data"
              action="/san-pham-chi-tiet/update2/${spct.id}">
            <div style="display: none">
                <div class="input-group input-group-sm mb-3">
                    <label class="input-group-text">ID</label>
                    <input disabled name="id" type="text" class="form-control" value="${spct.id}">
                    <br>
                </div>
                <div class="input-group input-group-sm mb-3">
                    <label class="input-group-text">San Pham</label>
                    <select name="idSanPham" class="form-select form-select-sm" aria-label="Small select example">
                        <c:forEach items="${listSp}" var="sp">
                            <option  ${spct.idSanPham.tenSanPham == sp.tenSanPham ? 'selected' : ''}
                                    value="${sp.id}">${sp.tenSanPham}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group input-group-sm mb-3">
                    <label class="input-group-text">Loai San Pham</label>
                    <select name="idLoaiSanPham" class="form-select form-select-sm"
                            aria-label="Small select example">
                        <c:forEach items="${listLsp}" var="lsp">
                            <option  ${spct.idLoaiSanPham.tenLoai == lsp.tenLoai ? 'selected' : ''}
                                    value="${lsp.id}">${lsp.tenLoai}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group input-group-sm mb-3">
                    <label class="input-group-text">Mau Sac</label>
                    <select name="idMauSac" class="form-select form-select-sm" aria-label="Small select example">
                        <c:forEach items="${listMs}" var="ms">
                            <option value="${ms.id}"  ${spct.idMauSac.tenMauSac == ms.tenMauSac ? 'selected' : ''}>${ms.tenMauSac}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group input-group-sm mb-3">
                    <label class="input-group-text">Kich Thuoc</label>
                    <select name="idKichThuoc" class="form-select form-select-sm" aria-label="Small select example">
                        <c:forEach items="${listKt}" var="kt">
                            <option value="${kt.id}"  ${spct.idKichThuoc.tenKichThuoc == kt.tenKichThuoc ? 'selected' : ''}>${kt.tenKichThuoc}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group input-group-sm mb-3">
                    <label class="input-group-text">Thuong Hieu</label>
                    <select name="idThuongHieu" class="form-select form-select-sm"
                            aria-label="Small select example">
                        <c:forEach items="${listTh}" var="th">
                            <option value="${th.id}"  ${spct.idThuongHieu.tenThuongHieu == th.tenThuongHieu ? 'selected' : ''}>${th.tenThuongHieu}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group input-group-sm mb-3">
                    <label class="input-group-text">Chat Lieu</label>
                    <select name="idChatLieu" class="form-select form-select-sm" aria-label="Small select example">
                        <c:forEach items="${listCl}" var="cl">
                            <option value="${cl.id}" ${spct.idChatLieu.tenChatLieu == cl.tenChatLieu ? 'selected' : ''}>${cl.tenChatLieu}</option>
                        </c:forEach>
                    </select>
                </div>
                <input type="number" name="giaBan" maxlength="50" class="form-control" id="validationCustom03"
                       value="${spct.giaBan}" required>
                <input type="number" name="soLuong" maxlength="50" class="form-control" id="validationCustom03"
                       value="${spct.soLuong}" required>
                <input type="text" name="moTa" maxlength="50" class="form-control" id="validationCustom03"
                       value="${spct.moTa}" required>

            </div>
            <img id="anh" src="/assets/images/imgSp/${spct.anhSanPham}">
            <div class="input-group input-group-sm mb-3">
                <label class="input-group-text" for="validationCustom03" class="form-label">Ảnh</label>
                <input type="file" name="file" accept=".png,.jpg,.gif,.svg,.tiff,.jpeg" class="form-control"
                       required>
                <button class="btn btn-outline-success" type="submit">Cập nhật ảnh</button>
            </div>
        </form>
    </div>
</div>

</div>
<style>
    .fixed-top-right {
        position: fixed !important;
        top: 0 !important;
        right: 0 !important;

    }

    .capNhat {
        font-size: 14px;
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 40px;
        margin-top: 20px;
    }
</style>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>

<script>
    (() => {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
<script>
    function confirmAction() {
        var xacNhan = confirm("Bạn có chắc chắn muốn cập nhật ?");
        if (xacNhan) {
        } else {
            // Nếu người dùng chọn "Cancel"
            event.preventDefault()
        }
    }
</script>
<script>
    $(document).ready(function() {
        $('#idSanPham').select2();
    });
    $(document).ready(function() {
        $('#idMauSac').select2();
    });
    $(document).ready(function() {
        $('#idKichThuoc').select2();
    });
    $(document).ready(function() {
        $('#idLoaiSanPham').select2();
    });
    $(document).ready(function() {
        $('#idChatLieu').select2();
    });
    $(document).ready(function() {
        $('#idThuongHieu').select2();
    });

</script>


</body>
</html>