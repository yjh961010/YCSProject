<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>neoheulge - 적금 상품</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #f39c12;
            --background-color: #f5f7fa;
            --text-color: #333;
            --card-background: #fff;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .section-title {
            text-align: center;
            color: var(--primary-color);
            font-size: 2.5em;
            margin-bottom: 40px;
            position: relative;
        }

        .section-title::after {
            content: '';
            display: block;
            width: 50px;
            height: 3px;
            background-color: var(--secondary-color);
            margin: 10px auto;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        .product-card {
            background-color: var(--card-background);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .product-image {
            background-color: var(--primary-color);
            color: white;
            font-size: 64px;
            height: 160px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .product-info {
            padding: 25px;
        }

        .product-title {
            font-size: 24px;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .product-info p {
            margin: 10px 0;
            font-size: 16px;
        }

        .show-details {
            background-color: var(--secondary-color);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
        }

        .show-details:hover {
            background-color: #e67e22;
        }

        .product-details {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            display: none;
        }

        @media (max-width: 768px) {
            .products {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="section-title">적금 상품</h2>
        <div class="products">
            <div class="product-card">
                <div class="product-image">💰</div>
                <div class="product-info">
                    <h3 class="product-title">스마트 적금</h3>
                    <p><strong>금리:</strong> 연 3.5%</p>
                    <p><strong>만기:</strong> 12개월</p>
                    <p><strong>최소금액:</strong> 10만원부터</p>
                    <button class="show-details" onclick="toggleDetails(this)">상세 정보</button>
                    <div class="product-details">
                        <p><strong>월 납입액:</strong> 10만원 ~ 300만원</p>
                        <p><strong>중도해지 금리:</strong> 기본금리의 50%</p>
                        <p><strong>특징:</strong> 스마트폰 앱을 통한 간편 가입 및 관리</p>
                    </div>
                </div>
            </div>
        
            <div class="product-card">
                <div class="product-image">💰</div>
                <div class="product-info">
                    <h3 class="product-title">스마트 적금</h3>
                    <p><strong>금리:</strong> 연 3.5%</p>
                    <p><strong>만기:</strong> 12개월</p>
                    <p><strong>최소금액:</strong> 10만원부터</p>
                    <button class="show-details" onclick="toggleDetails(this)">상세 정보</button>
                    <div class="product-details">
                        <p><strong>월 납입액:</strong> 10만원 ~ 300만원</p>
                        <p><strong>중도해지 금리:</strong> 기본금리의 50%</p>
                        <p><strong>특징:</strong> 스마트폰 앱을 통한 간편 가입 및 관리</p>
                    </div>
                </div>
            </div>
        
            <div class="product-card">
                <div class="product-image">💰</div>
                <div class="product-info">
                    <h3 class="product-title">스마트 적금</h3>
                    <p><strong>금리:</strong> 연 3.5%</p>
                    <p><strong>만기:</strong> 12개월</p>
                    <p><strong>최소금액:</strong> 10만원부터</p>
                    <button class="show-details" onclick="toggleDetails(this)">상세 정보</button>
                    <div class="product-details">
                        <p><strong>월 납입액:</strong> 10만원 ~ 300만원</p>
                        <p><strong>중도해지 금리:</strong> 기본금리의 50%</p>
                        <p><strong>특징:</strong> 스마트폰 앱을 통한 간편 가입 및 관리</p>
                    </div>
                </div>
            </div>
        
            <div class="product-card">
                <div class="product-image">💰</div>
                <div class="product-info">
                    <h3 class="product-title">스마트 적금</h3>
                    <p><strong>금리:</strong> 연 3.5%</p>
                    <p><strong>만기:</strong> 12개월</p>
                    <p><strong>최소금액:</strong> 10만원부터</p>
                    <button class="show-details" onclick="toggleDetails(this)">상세 정보</button>
                    <div class="product-details">
                        <p><strong>월 납입액:</strong> 10만원 ~ 300만원</p>
                        <p><strong>중도해지 금리:</strong> 기본금리의 50%</p>
                        <p><strong>특징:</strong> 스마트폰 앱을 통한 간편 가입 및 관리</p>
                    </div>
                </div>
            </div>
            <!-- 다른 상품들도 위와 같은 구조로 추가 -->
        </div>
    </div>

    <script>
        function toggleDetails(button) {
            var details = button.nextElementSibling;
            if (details.style.display === "none" || details.style.display === "") {
                details.style.display = "block";
                button.textContent = "상세 정보 접기";
            } else {
                details.style.display = "none";
                button.textContent = "상세 정보";
            }
        }
    </script>
</body>
</html>

<%@ include file="../footer.jsp" %>