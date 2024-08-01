<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>적금 사이트</title>
    <link rel="stylesheet" type="text/css" href="css/mainStyle.css">
    
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
                <a href="#board">커뮤니티</a>
                <a href="#products">상품 목록</a>
                <a href="#help">고객지원</a>
            </nav>
        </div>
    </header>

    <main>
         <section class="hero">
            <div class="hero-content">
                <div class="slideshow-container">
                    <div class="slides fade">
                        <img src="img/images1.jpg" width="100%" height="280">
                    </div>
                    <div class="slides fade">
                        <img src="img/images2.jpg" width="100%" height="280">
                    </div>
                    <div class="slides fade">
                        <img src="img/images3.jpg" width="100%" height="280">
                    </div>
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>
                <div class="login-form">
                    <h2>로그인</h2>
                    <form action="login" method="post">
                        <input type="text" name="username" placeholder="사용자 이름" required>
                        <input type="password" name="password" placeholder="비밀번호" required>
                        <button type="submit">로그인</button>
                    </form>
                    <div class="links">
                        <a href="/find-id">아이디 찾기</a> |
                        <a href="/find-password">비밀번호 찾기</a> | 
                        <a href="/signup">회원가입</a>
                    </div>
                </div>
            </div>
        </section>

        <section id="products" class="products">
            <div class="container">
                <h2>상품</h2>
                <div class="product-list">
                    <!-- 여기에 동적으로 상품 목록을 추가할 수 있습니다 -->
                    <div class="product-item">
                        <h3>상품 1</h3>
                        <p>연 2.5% 이율</p>
                        <a href="#" class="btn">자세히 보기</a>
                    </div>
                    <div class="product-item">
                        <h3>상품 2</h3>
                        <p>연 3.0% 이율</p>
                        <a href="#" class="btn">자세히 보기</a>
                    </div>
                    <div class="product-item">
                        <h3>상품 3</h3>
                        <p>연 5.0% 이율</p>
                        <a href="#" class="btn">자세히 보기</a>
                    </div>
                    <div class="product-item">
                        <h3>상품 4</h3>
                        <p>연 10.0% 이율</p>
                        <a href="#" class="btn">자세히 보기</a>
                    </div>
                </div>
            </div>
        </section>
        
        
    <section id="community" class="community">
    <div class="container">
                <h2>커뮤니티 글 목록</h2>
        <div class="community-content">
            <div class="community-posts">
                <div class="post-item">
                    <h3>글 제목 1</h3>
                    <p>글 내용 요약...</p>
                    <a href="#" class="btn">자세히 보기</a>
                </div>

                <!-- 추가적인 커뮤니티 글 -->
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
</section>

        
    </main>

    <footer>
        <div class="container">
            <p>&copy; neoheulge. 조원 모든 권리 보유.</p>
            <p>[우편번호]종로 아이티뱅크 509호</p>
            <p>대표 전화 : xxx-xxxx-xxxx</p>
            <p>문의 메일 : xxx@xxxx.com</p>
          
        </div>
    </footer>
</body>
</html>
