<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<jsp:include page="../header.jsp" />
<link rel="stylesheet" type="text/css" href="/css/member/myStyle.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<main>
	<div class="myPage">
		<div class="header-content">
			<div class="account"
				style="width: 750px; height: 260px; border: 1px solid #ccc; padding: 10px; display: flex; justify-content: center; align-items: center; text-align: center;">
	<%-- 			
    <div>
        <p>등록된 계좌가 없습니다.</p>
        <form action="<c:url value='/account/add'/>" method="get">
            <button type="submit" style="display: flex; align-items: center; justify-content: center;">
                <!-- 동그라미 안에 + 기호 이미지 -->
                <img src="${pageContext.request.contextPath}/img/plus-circle.png" alt="plus" style="width: 20px; height: 20px; margin-right: 5px;">
                계좌 추가하기
            </button>
        </form>
    </div>
      --%>
    
				<div>
					<p>계좌 번호: ${account.number}</p>
					<p>현재 충전된 금액: ${account.balance}원</p>
					<form action="<c:url value='/account/add' />" method="get"
						style="display: inline;">
						<button type="submit" style="margin-right: 10px;">계좌 추가</button>
					</form>
					<form action="<c:url value='/account/delete' />" method="post"
						style="display: inline;">
						<button type="submit">계좌 삭제</button>
					</form>
				</div>
			
			
			
			</div>
			<div class="login-form">
				<sec:authorize access="isAuthenticated()">
                    <h2>안녕하세요, <sec:authentication property="principal.username"/> 님!</h2>
                 	<div><a href="${pageContext.request.contextPath}/member/myPage.do">마이 페이지</a></div>
                 	<div>대표 계좌 잔액 : 100원 </div>
                    <form action="<c:url value='/logout' />" method="post">
                        <button type="submit">로그아웃</button>
                    </form>
                </sec:authorize>
			</div>

		</div>
	</div>
</main>
<jsp:include page="../footer.jsp" />