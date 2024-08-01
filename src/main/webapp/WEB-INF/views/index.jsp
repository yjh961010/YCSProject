<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<jsp:include page="header.jsp"/>

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
        <h2>상품 목록</h2>
        <div class="product-list">
            <div class="product-item">
                <div class="circle">
                    <img src="images/money.jpg" class="circle-bg" alt="상품 이미지">
                    <div class="amount">100,000원</div>
                </div>
                <h3 class="product-name">상품 1</h3>
            </div>
            <div class="product-item">
                <div class="circle">
                    <img src="images/money.jpg" class="circle-bg" alt="상품 이미지">
                    <div class="amount">325,000원</div>
                </div>
                <h3 class="product-name">상품 2</h3>
            </div>
            <div class="product-item">
                <div class="circle">
                    <img src="images/money.jpg" class="circle-bg" alt="상품 이미지">
                    <div class="amount">505,000원</div>
                </div>
                <h3 class="product-name">상품 3</h3>
            </div>
            <div class="product-item">
                <div class="circle">
                    <img src="images/money.jpg" class="circle-bg" alt="상품 이미지">
                    <div class="amount">900,000원</div>
                </div>
                <h3 class="product-name">상품 4</h3>
            </div>
            <!-- 추가 상품들 -->
        </div>
    </div>
</section>
        
        
    <section id="community" class="community">
    <div class="container">
                <h2>커뮤니티</h2>
        <div class="community-content">
            <div class="community-posts">
                <div>
                    <h3>공지글</h3>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
                </div>
            </div>
            <div class="community-posts">
                <div>
                    <h3>커뮤니티</h3>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
                    <p>글 내용 요약...</p>
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
</section>

        
    </main>

<jsp:include page="footer.jsp"/> 

