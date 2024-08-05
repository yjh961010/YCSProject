<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>적금 사이트</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainStyle.css">
    
  <script>
        let slideIndex = 1;

        function showSlides(n) {
            let slides = document.getElementsByClassName("slides");
            if (n > slides.length) {slideIndex = 1}
            if (n < 1) {slideIndex = slides.length}
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex-1].style.display = "block";
        }

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function autoShowSlides() {
            plusSlides(1);
            setTimeout(autoShowSlides, 5000); // Change image every 5 seconds
        }

        window.onload = function() {
            showSlides(slideIndex);
            autoShowSlides();
        }
        
        
    </script>
</head>
<body>
<header>
        <div class="container">
            <h1>neoheulge</h1>
            <div class="scrolling-text-container">
            <div class="scrolling-text">상품1의 당첨자 xxx님,상품2의 당첨자 xxx님</div>
        </div>
            <nav>
                <a href="${pageContext.request.contextPath}/commu/commuList.do">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/notice/noticeboard.do">공지사항</a>
                <a href="#products">상품 목록</a>
                <a href="#help">고객지원</a>
                <a href="${pageContext.request.contextPath}/admin/adminmember.do">회원관리</a>
            </nav>
        </div>
    </header>
