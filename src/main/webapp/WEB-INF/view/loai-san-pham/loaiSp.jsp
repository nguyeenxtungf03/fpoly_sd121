<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="path/to/your/custom/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>

<body class="container">
<form id="myForm5" action="/loai-san-pham/add" method="post">
    <span>Tên loại sản phẩm </span><br>
    <input style="height: 100%" type="text" required name="tenLoai"><br>
    <span style="color: red">${errors}</span><br>
    <button class="btn btn-primary" type="submit">Thêm</button>
</form>

<script>
    document.getElementById('myForm5').addEventListener('submit', function (event) {
        event.preventDefault();
        window.location.reload();

        // Get form data
        var formData = new FormData(event.target);

        // Perform Ajax request
        fetch('/loai-san-pham/add', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json()) // Assuming the server returns JSON
            .then(data => {
                console.log(data);

            })
            .catch(error => {
                console.error('Error:', error);
            });
    });
</script>
</body>

</html>
