<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi ${error}</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css/animate.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/hover.css/css/hover-min.css">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<body>
<div class="error-container animate__animated animate__fadeIn">
    <div class="error-code hvr-grow">${error}</div>
    <div class="error-message">${bigText}</div>
    <p class="lead fade-in">${smallText}</p>
    <a href="javascript:void(0);" id="goBackButton" class="btn btn-danger hvr-grow">
        <i style="font-style: normal;" class="bi bi-arrow-left"> Quay lại trang</i>
    </a>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="scripts.js"></script> <!-- Tạo file scripts.js cho các tùy chỉnh JavaScript -->
<style>
    body {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
        background-color: #f8f9fa;
    }

    .error-container {
        text-align: center;
        max-width: 450px;
    }

    .error-code {
        font-size: 120px;
        color: #dc3545;
    }

    .error-message {
        font-size: 30px;
        margin-bottom: 20px;
    }

    /* Animate.css class for fade-in effect */
    .fade-in {
        opacity: 0;
        animation: fadeIn 1s forwards;
    }

    /* Hover.css class for button hover effect */
    .hvr-grow {
        display: inline-block;
        vertical-align: middle;
        transform: perspective(1px) translateZ(0);
        box-shadow: 0 0 1px rgba(0, 0, 0, 0);
        transition-duration: 0.3s;
        transition-property: transform;
    }

    .hvr-grow:hover,
    .hvr-grow:focus,
    .hvr-grow:active {
        transform: scale(1.1);
    }

    /* Additional styles for scroll effect */
    body.scrolled {
        opacity: 0.8;
        transition: opacity 0.5s ease-in-out;
    }

</style>
<script>
    $(document).ready(function() {
        $('#goBackButton').click(function() {
            history.back();
        });

        // Scroll effect
        $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
                $('body').addClass('scrolled');
            } else {
                $('body').removeClass('scrolled');
            }
        });
    });

</script>
</body>
</html>

