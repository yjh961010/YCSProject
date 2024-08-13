<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/css/member/myStyle.css">
    <style>
    

         :root {
            --primary-color: #4a90e2;
            --secondary-color: #f39c12;
            --background-color: #f5f7fa;
            --text-color: #333;
            --card-background: #fff;
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
             grid-template-columns: repeat(2, 1fr);
             gap: 30px;
             margin-bottom : 20px;
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

         .vanner {
             flex: 1;
             max-width: 750px;
             margin-right: 20px;
         }

         .vanner img {
             width: 100%;
             height: auto;
         }
         .header-content {
             display: flex;
             justify-content: space-between;
             align-items: flex-start;
             margin-bottom: 20px;
         }

        @media (max-width: 768px) {
            .products {
                grid-template-columns: 1fr;
            }
            .header-content {
                flex-direction: column;
                align-items: center;
            }
            .vanner, .login-ad-container {
                width: 100%;
                max-width: 750px;
                margin-right: 0;
                margin-bottom: 20px;
            }

            .login-form, .ad_container {
                width: 100%;
                max-width: 250px;
                margin: 0 auto 20px;
            }
        }
    </style>

<div class="myPage">
<div class="header-content">
     <div class="vanner">
            <img alt="main" src="${pageContext.request.contextPath}/img/van.jpg" style="width:750px; height: 280px;">
        </div>
        <div class="login-form">
            <sec:authorize access="isAuthenticated()">
                <img src="https://blogpfthumb-phinf.pstatic.net/MjAyNDA3MTZfMjAg/MDAxNzIxMTE1NzY3MjY4.ueDvccl7mHx7z0DVBHHqagXj2aoAhIi1uSYaQrufjS4g.1xT_9Yxv4LolXwixUFJ-SEK-Y0z39lD3qbv2YsZbhS4g.JPEG/%EC%96%B4%EB%9E%98%EA%B3%A4.jpeg/%25EC%2596%25B4%25EB%259E%2598%25EA%25B3%25A4.jpeg?type=w161"
                     alt="프로필 이미지"/>
                <div class="nick">
                    <strong class="itemfont col" id="nickNameArea">현재 접속 아이디</strong> <br>
                    <span class="itemfont col">
                        <a id="blogDomainChange" onclick="return false;" class="set_domain_btn">
                        <span class="blog_domain col"> <sec:authentication property="principal.username"/> </span>
                        <span class ="set_domain_iconcol"></span>
                        </a>
                    </span>
                </div>
                <form action="<c:url value='/logout' />" method="post">
                    <button type="submit">로그아웃</button>
                </form>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <h4>neoheulge <br> 더 안전하고 더 편리하게</h4>
                <form action="<c:url value='/login' />" method="post">
                    <input type="text" name="username" placeholder="사용자 이름" required>
                    <input type="password" name="password" placeholder="비밀번호" required>
                    <button type="submit">로그인</button>
                </form>
                <div class="links">
                    <a href="/find-id">아이디 찾기</a> |
                    <a href="/find-password">비밀번호 찾기</a> |
                    <a href="${pageContext.request.contextPath}/member/signup.do">회원가입</a>
                </div>
            </sec:authorize>
        </div>
    </div>
      


    <div class="commu-container">
            <div class="community-content">
                <div class="community-posts">
                    <div>
                        <h3>공지글</h3>
                        <c:forEach var="dto" items="${noticeList}" varStatus="status">
                            <c:if test="${status.index < 5}">
                                <p>
                                    <a href="/notice/noticeView.do?id=${dto.id}">
                                            ${dto.subject}
                                    </a>
                                </p>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="community-posts">
                    <div>
                        <h3>커뮤니티</h3>
                        <c:forEach var="dto" items="${commuList}" varStatus="status">
                            <c:if test="${status.index < 5}">
                                <p>
                                    <a href="/commu/commuContent.do?id=${dto.id}">
                                            ${dto.subject}
                                    </a>
                                </p>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="community-prizes">
                    <h3>전회차 상금</h3>
                    <p>상품1 100,000원</p>
                    <p>상품2 145,000원</p>
                    <p>상품3 609,000원</p>
                    <p>상품4 1,681,500원</p>
                </div>
            </div>
    </div>

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


<%@ include file="../footer.jsp" %>