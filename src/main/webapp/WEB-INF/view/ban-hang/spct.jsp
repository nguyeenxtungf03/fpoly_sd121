<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="widtd=device-widtd, initial-scale=1">
    <title>BÁN HÀNG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<style>
    .invoice-picked {
        color: white;
        background-color: #191a20;
    }
</style>
<body style="background-color: #bebebe; margin: 0; padding: 0">
<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <a href="/ban-hang" style="color: #191a20; margin: 0 5px 5px 20px"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
        </svg></a>
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <form class="d-flex" role="search" method="get" action="/ban-hang">
                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search" name="tenSp" >
                    <button class="btn btn-outline-secondary" type="submit"><svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg></button>
                </form>
            </div>
            <div><p7><svg style="margin-top: -3px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg> ${username}</p7></div>
        </div>
    </nav>
</header>
<section>
<div class="container" style="height: calc(100vh - 79px); background-color: #e1e1e1">
    <div class="row" style="margin-right: 100px">
        <div class="col-4 mt-4" style="padding: 0 100px">
            <div>
                <img height="auto" width="240px" src="../../../assets/images/imgSp/${mainImg}">
            </div>
            <div class="row" style="width: 264px">
                <c:forEach end="5" items="${listImg}" var="img">
                        <img class="col-4 mt-3" height="auto" width="78px" src="../../../assets/images/imgSp/${img}">
                </c:forEach>
            </div>
        </div>
        <div class="col-8 mt-4" style="background-color: white; height: 500px;">
            <div>
                <h4>${tenSp}</h4>
            </div>
            <form method="get" id="formOptions">
                <p style="margin: 5px; font-weight: 600">Màu Sắc: </p>
                <c:forEach items="${listColor}" var="color">
                    <input type="radio" class="btn-check" name="color" id="color${color.id}" autocomplete="off" value="${color.id}" <c:if test="${mainColorId == color.id}">checked</c:if> onclick="checkSelection()">
                    <label class="btn mb-3" for="color${color.id}">${color.tenMauSac}</label>
                </c:forEach>
                <p style="margin: 5px; font-weight: 600">Kích Thước: </p>
                <c:forEach items="${listSize}" var="size">
                    <input type="radio" class="btn-check" name="size" id="size${size.id}" autocomplete="off" value="${size.id}" <c:if test="${mainSizeId == size.id}">checked</c:if> onclick="checkSelection()">
                    <label class="btn mb-3" for="size${size.id}">${size.tenKichThuoc}</label>
                </c:forEach><br>
                <input id="idHdcOption" name="idHdc" type="text" style="display: none">
            </form>
            <div id="form-product-info" <c:if test="${displayProductInfo == false}">style="display: none"</c:if>>
                <p><span style="font-weight: 600">Giá bán:</span>
                    <c:if test="${giaKM == null}">
                        ${price}
                    </c:if>
                    <c:if test="${giaKM != null}">
                        <span style="color: red; text-decoration: line-through">${price}</span>
                        <span>${giaKM}</span>
                        <span style="color: green; margin-left: 30px">(sản phẩm đang được giảm giá ${mess})</span>
                    </c:if>
                </p>
                <p><span style="font-weight: 600">Số lượng:</span> ${quantity}</p>
                <form method="post" action="/ban-hang/them-vao-gio">
                    <input style="display: none" type="text" value="${idSpct}" name="idSpct">
                    <label for="soLuong" class="form-label" style="font-weight: 600">Số lượng mua</label>
                    <input type="number" id="soLuong" name="soLuongMua" onkeyup="validateQuantity()" onchange="validateQuantity()">
                    <input id="idHdc" name="idHdc" type="text" style="display: none">
                    <button id="submitButton" class="btn btn-outline-secondary" type="submit" style="padding: 3px 12px; margin-bottom: 5px" disabled>+</button>
                    <p id="errorText" style="color: red; display: none;">Số lượng vượt quá số lượng có sẵn!</p>
                </form>
            </div>
        </div>
    </div>
</div>
</section>
<footer style="height: 25px; background-color: #4f4f4f; color: white; text-align: center">SD121 - FPT POLYTECHNIC</footer>

<script>
    const colorRadios = document.getElementsByName('color');
    const sizeRadios = document.getElementsByName('size');
    const productInfo = document.getElementById('form-product-info');

    function checkSelection() {
        let colorSelected = false;
        let sizeSelected = false;
        for (let i = 0; i < colorRadios.length; i++) {
            if (colorRadios[i].checked) {
                colorSelected = true;
                break;
            }
        }
        for (let i = 0; i < sizeRadios.length; i++) {
            if (sizeRadios[i].checked) {
                sizeSelected = true;
                break;
            }
        }
        if (colorSelected && sizeSelected) {
            document.getElementById('formOptions').submit();
        }
    }

    for (let i = 0; i < colorRadios.length; i++) {
        colorRadios[i].addEventListener('change', checkSelection);
    }

    for (let i = 0; i < sizeRadios.length; i++) {
        sizeRadios[i].addEventListener('change', checkSelection);
    }

    function validateQuantity() {
        const availableQuantity = parseInt('${quantity}');
        const inputQuantity = parseInt(document.getElementById('soLuong').value);

        const submitButton = document.getElementById('submitButton');
        const errorText = document.getElementById('errorText');

        if (inputQuantity < 1 || availableQuantity < 1) {
            submitButton.disabled = true;
        } else if (inputQuantity > availableQuantity) {
            submitButton.disabled = true;
            errorText.style.display = 'block';
        } else {
            submitButton.disabled = false;
            errorText.style.display = 'none';
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