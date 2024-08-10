<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../header.jsp" />
<link rel="stylesheet" type="text/css" href="/css/commu/commuStyle.css">
<script>
	function performSearch() {
		var searchType = document.getElementById("searchType").value;
		var searchTerm = document.getElementById("search").value.trim();

		if (searchTerm !== "") {
			var currentURL = window.location.href.split('?')[0];
			var queryString = "?searchType=" + searchType + "&search="
					+ encodeURIComponent(searchTerm);
			window.location.href = currentURL + queryString;
		} else if (searchTerm === "") {
			var currentURL = window.location.href.split('?')[0];
			window.location.href = currentURL;
		}
	}

	function checkLogin() {
		alert("로그인이 필요합니다.");
		window.location.href = "/index.do";

	}

	function handleAdClick() {
		var adModal = document.getElementById('adModal');
		adModal.style.display = 'block';
	}

	function closeAdModal() {
		var adModal = document.getElementById('adModal');
		adModal.style.display = 'none';
	}
</script>
<div class="total-area">
	<div class="sidebar">
		<div class="ad_container">
			<div class="login_container">
				<sec:authorize access="isAuthenticated()">
					<img
						src="https://blogpfthumb-phinf.pstatic.net/MjAyNDA3MTZfMjAg/MDAxNzIxMTE1NzY3MjY4.ueDvccl7mHx7z0DVBHHqagXj2aoAhIi1uSYaQrufjS4g.1xT_9Yxv4LolXwixUFJ-SEK-Y0z39lD3qbv2YsZbhS4g.JPEG/%EC%96%B4%EB%9E%98%EA%B3%A4.jpeg/%25EC%2596%25B4%25EB%259E%2598%25EA%25B3%25A4.jpeg?type=w161"
						alt="프로필 이미지">
					<div class="nick">
						<strong class="itemfont col" id="nickNameArea">닉네임</strong> <br>
						<span class="itemfont col"> <a id="blogDomainChange"
							onclick="return false;" class="set_domain_btn"> <span
								class="blog_domain col"> 아이디</span> <spanclass ="set_domain_iconcol"></span>
						</a> </span>
					</div>
					<form action="/logout" method="post">
						<button type="submit" class="login-button">로그아웃</button>
					</form>

					<button onclick="performSearch()" class="login-button">채팅하기</button>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
 <!-- 로그인 폼을 표시합니다. -->
                    <h1>neoheulge</h1>
                    <h4>더 안전하고 </h4>
                    <h4>편리하게 이용하세요</h4>
                    <form action="<c:url value='/login' />" method="post">
                        <input type="text" name="username" placeholder="사용자 이름" required>
                        <input type="password" name="password" placeholder="비밀번호" required>
                        <button type="submit" class="login-button">로그인</button>
                    </form>
                    <div class="links">
                        <a href="${pageContext.request.contextPath}/member/findid.do">▶ 아이디 찾기</a>  <br>
                        <a href="/find-password">▶ 비밀번호 찾기</a>  <br>
                        <a href="${pageContext.request.contextPath}/member/signup.do">▶ 회원가입</a>
                    </div>


				</sec:authorize>
			</div>
		</div>
		<div class="ad_container">
			<button type="button" class="ad_mark" onclick="handleAdClick()">
				<span class="blind" style="left: 9px;"">AD | X </span>
			</button>
			<div class="confirm_btns" id="adModal" style="display: none;">
				<p class="feedback_title">이 광고를 그만 보시겠습니까?</p>
				<button type="button" class="confirm_btn" onclick="closeAdModal()">예</button>
				<button type="button" class="confirm_btn" onclick="closeAdModal()">아니오</button>
			</div>
			<img src="/img/광고.jpg" alt="Advertisement"
				style="position: relative; width: 200px; height: 180px; vertical-align: bottom; left: 29px;">
			<div class="ad_containerinside">
				<br> <br> <strong>포켓몬X잇지 콜라보레이션</strong>
				<p>포켓몬스터 게임을 핸드폰으로 플레이할 수 있다!</p>
				<div class="source_box">
					<span class="content_landing">더 알아보기</span>
				</div>

			</div>
		</div>
	</div>
	<div class="commu">
		<h1>커뮤니티</h1>
		<br>
		<div class="search-form">
			<select id="searchType">
				<option value="all"
					<c:if test="${searchType == 'all'}">selected</c:if>>전체</option>
				<option value="subject"
					<c:if test="${searchType == 'subject'}">selected</c:if>>제목</option>
				<option value="author"
					<c:if test="${searchType == 'author'}">selected</c:if>>작성자</option>
			</select> <input type="text" placeholder="검색어를 입력하세요" id="search"
				value="${search}">
			<button onclick="performSearch()">검색</button>
		</div>
		<div id="commu">
			<table align="right" style="margin-bottom: 20px">
				<tr>
					<td><sec:authorize access="isAuthenticated()">
							<a href="/commu/commuWrite.do" class="write-btn">글쓰기</a>
						</sec:authorize> <sec:authorize access="isAnonymous()">
							<a href="javascript:void(0);" class="write-btn"
								onclick="checkLogin()">글쓰기</a>
						</sec:authorize></td>
				</tr>
			</table>
			<table class="commu-table">
				<thead>
					<tr class="commu-header">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty commuList}">
						<tr>
							<td colspan="5" class="no-data">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${commuList}">
						<tr class="commu-row">
							<td align="center">${dto.id}</td>
							<td align="left">
								<!-- 're_level'에 따라 공백 추가 --> <c:choose>
									<c:when test="${dto.re_level > 0}">
										<c:forEach var="i" begin="1" end="${dto.re_level}">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<!-- 4 공백 -->
										</c:forEach>
										<span>ㄴ[re]: </span>
									</c:when>
									<c:otherwise>
										<span></span>
									</c:otherwise>
								</c:choose> <a href="/commu/commuContent.do?id=${dto.id}"
								class="commu-link">${dto.subject}</a>
							</td>
							<td align="center">${dto.author}</td>
							<td align="center">${dto.createtime}</td>
							<td align="right">${dto.views}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<c:if test="${not empty commuList}">
				<div class="pagination">

					<%
					int pageSize = 5;
					int currentPage = (request.getParameter("pageNum") != null) ? Integer.parseInt(request.getParameter("pageNum")) : 1;
					int count = (Integer) request.getAttribute("count");
					int pageBlock = 5;
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
					int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
					int endPage = startPage + pageBlock - 1;
					if (endPage > pageCount)
						endPage = pageCount;
					%>

					<%
					if (startPage > pageBlock) {
					%>
					<a href="/commu/commuList.do?pageNum=<%=startPage - pageBlock%>">&laquo;
						이전</a>
					<%
					}
					%>


					<%
					for (int i = startPage; i <= endPage; ++i) {
					%>
					<a href="/commu/commuList.do?pageNum=<%=i%>"
						class="<%=(i == currentPage) ? "active" : ""%>"><%=i%></a>
					<%
					}
					%>


					<%
					if (endPage < pageCount) {
					%>
					<a href="/commu/commuList.do?pageNum=<%=startPage + pageBlock%>">다음
						&raquo;</a>
					<%
					}
					%>
				</div>
			</c:if>
		</div>
	</div>

</div>
<jsp:include page="../footer.jsp" />
