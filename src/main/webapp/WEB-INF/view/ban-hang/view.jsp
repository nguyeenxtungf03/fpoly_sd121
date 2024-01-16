<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>Poly121 Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<style>
    .btn-delete-from-cart {
        line-height: 14px;
        padding-bottom: 11px;
        margin-top: -11px;
        margin-bottom: -7px;
    }
    .invoice-picked {
        color: white;
        background-color: #191a20;
    }
</style>
<body style="background-color: #bebebe; margin: 0; padding: 0">
<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <a href="/trang-chu" class="logo" style="margin-right: 20px">
                    <img src="assets/images/logo.png">
                </a>
                <form class="d-flex" role="search" method="get" action="/ban-hang">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search" name="tenSp" >
                    <button class="btn btn-outline-secondary" type="submit"><svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg></button>
                </form>
                <c:forEach items="${listHoaDonCho}" var="hdc" end="5">
                    <div><a href="?idHdc=${hdc.id}"
                            style="padding: 5px; margin: 0 8px; text-decoration: none; border-radius: 5px;
                            <c:if test="${idHdc != hdc.id}">background-color: #c7c7c7; color: black;"</c:if>
                            <c:if test="${idHdc == hdc.id}">background-color: green; color: white;"</c:if>>${hdc.maHoaDon}</a> <a href="ban-hang/xoa-hoa-don-cho/${hdc.id}" style="text-decoration: none; color: white; background-color: red; padding: 5px 8px; margin-left: -8px; margin-right: 10px; border-radius: 7px">X</a></div>
                </c:forEach>
            </div>
            <div><p7><svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg> ${username}</p7></div>
        </div>
    </nav>
</header>
<section>
    <div class="row" style="height: calc(100vh - 76px); margin: 0; padding: 10px 0 0 0">
        <div class="col-9" style="height: 100%;">
            <div class="w-100" style="height: calc(50% - 26px); background-color: #ffffff; overflow: auto;">
                <table class="table w-100">
                    <tbody>
                    <c:forEach items="${listSpgh}" var="spgh" varStatus="loop">
                        <tr>
                            <th>${loop.index + 1}</th>
                            <td>${spgh.ten}</td>
                            <td>${spgh.mauSac}</td>
                            <td>${spgh.kichThuoc}</td>
                            <td><c:if test="${spgh.giaTruocKM != null && spgh.giaTruocKM > spgh.gia}"><span style="color: red; text-decoration: line-through; font-size: 13px">${spgh.giaTruocKM}VNĐ</span></c:if> ${spgh.gia} VNĐ</td>
                            <td>${spgh.soLuong}</td>
                            <td><a href="/ban-hang/san-pham-trong-gio/${spgh.idSpct}/xoa" class="btn btn-danger btn-delete-from-cart">x</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="w-100" style="height: 50%; background-color: #bebebe; position: relative">
                <div style="position: absolute; top: 5px; right: 0; display: flex">
                    <div style="margin-top: 4px; margin-right: 12px">${pageSp.getNumber() + 1}/${pageSp.getTotalPages()}</div>
                    <c:if test="${pageSp.getNumber() + 1 > 1}">
                        <a href="?page=${pageSp.getNumber()}&tenSp=${param.tenSp}" style="padding: 2px 7px 7px 7px; margin: 0 6px 0 12px; border-radius: 5px; background-color: #ffffff; text-decoration: none; color: black"><</a>
                    </c:if>
                    <c:if test="${pageSp.getNumber() + 1 lt pageSp.getTotalPages()}">
                        <a href="?page=${pageSp.getNumber() + 2}&tenSp=${param.tenSp}" style="padding: 2px 7px 7px 7px; border-radius: 5px; background-color: #ffffff; text-decoration: none; color: black">></a>
                    </c:if>
                </div>

                <div class="row" style="height: 100%">

                    <c:if test="${not pageSp.isEmpty()}">
                    <c:forEach items="${pageSp.getContent()}" var="sp">
                        <div class="col-2 pt-5">
                            <div>
                                <a style="text-decoration: none" href="/ban-hang/spct/${sp.getIdSp()}?idHdc=${idHdc}">
                                    <div class="card">
                                        <img class="card-img-top" height="150px" src="../../assets/images/imgSp/${sp.getAnh()}" alt="Card image cap">
                                        <div class="card-body" style="min-height: 110px">
                                            <p class="card-title" style="font-weight: bolder; max-height: 3em; overflow: hidden; line-height: 1.5em;">${sp.getTen()}</p>
                                            <p class="card-text" style="" > ${sp.getGia()} VNĐ</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                    </c:if>

                    <c:if test="${pageSp.isEmpty()}">
                        <h3 style="text-align: center; margin-top: 100px">Không tìm thấy sản phẩm</h3>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="col-3" style="height: 100%; background-color: #ffffff">
            <form method="post" action="/ban-hang/luu-hoa-don">
                <input id="idHdc" type="text" name="idHdc" style="display: none ">
                <div style="margin: 10px 0">
                    <label for="tongTien" style="min-width: 145px">Tổng tiền hàng: </label>
                    <input id="tongTien" type="text" name="tongTien" value="${tongTien}" style="border: none; text-align: right" disabled> <span>₫</span>
                </div>
                <div style="margin: 10px 0">
                    <label for="canTra" style="min-width: 145px">Khách cần trả: </label>
                    <input id="canTra" type="text" name="canTra" value="${canTra}" style="border: none; text-align: right" disabled> <span>₫</span>
                </div>
                <div style="margin: 10px 0">
                    <label for="khachTra" style="min-width: 145px">Khách trả: </label>
                    <input id="khachTra" type="number" name="khachTra" style="border: none; text-align: right" onkeyup="calculateChange()" onchange="calculateChange()"> <span>₫</span>
                </div>
                <div style="margin: 10px 0">
                    <label for="tienThua" style="min-width: 145px">Tiền thừa trả khách: </label>
                    <input id="tienThua" type="text" name="tienThua" value="${tienThua}" style="border: none; text-align: right" disabled> <span>₫</span>
                </div>
                <div class="form-floating">
                    <textarea name="ghiChu" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
                    <label for="floatingTextarea2">Ghi chú:</label>
                </div>
                <button id="submitButton" type="submit" class="btn btn-success mt-3" name="action" value="thanhToan" style="padding-left: 45px; padding-right: 45px; margin-left: 20px" disabled>Thanh Toán</button>
                <button type="submit" class="btn btn btn-outline-success mt-3" name="action" value="choThanhToan">Chờ Thanh Toán</button>
            </form>
        </div>
    </div>
</section>

<script>
    function calculateCanTra() {
        var tongTien = parseFloat(document.getElementById('tongTien').value.replace(/,/g, '')) || 0;
        var giamGia = parseFloat(document.getElementById('giamGia').value.replace(/,/g, '')) || 0;

        var canTra = tongTien - giamGia;

        document.getElementById('canTra').value = canTra;
    }

    function calculateChange() {
        var canTra = parseFloat(document.getElementById('canTra').value.replace(/,/g, '')) || 0;
        var khachTra = parseFloat(document.getElementById('khachTra').value.replace(/,/g, '')) || 0;

        var tienThua = khachTra - canTra;

        document.getElementById('tienThua').value = tienThua;

        const submitButton = document.getElementById('submitButton');
        if (tienThua < 0) {
            submitButton.disabled = true;
        } else {
            submitButton.disabled = false;
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        var myInput = document.getElementById('idHdc');
       if ('${idHdc}' != null) {
            myInput.value = '${idHdc}';
        } else {
            myInput.value = '  ';
        }
       if ('${err}') {
           window.alert('${errMess}')
       }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>