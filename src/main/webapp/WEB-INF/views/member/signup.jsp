<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="../header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/signup.css">
<div align="center" style="margin-top: 80px;">
	<h1>
		<span style="font-weight: bold; color: #004d99;">회원가입</span>
	</h1>
	<div align="center" style="margin-top: 40px;">
		<form action="/member/signupPro.do" method="post"
			class="form-table">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="signForm">
				<table>
					<tr>
						<td style="text-align: center;"><label for="name"
							style="display: none">이름</label> <input type="text" name="name"
							placeholder="이름 입력(필수)"></td>
					</tr>
					<tr>
						<td style="text-align: center;"><label for="memberID"
							style="display: none">아이디</label> <input type="text"
							name="memberID" placeholder="아이디 입력(필수)"></td>
					</tr>
					<tr>
						<td style="text-align: center;"><label for="password"
							style="display: none">비밀번호</label> <input type="password"
							name="password" placeholder="비밀번호 입력(필수)"></td>
					</tr>
					<tr>
						<td style="text-align: center;"><label for="profile"
							style="display: none">프로필 사진</label> <input type="text"
							name="profile" placeholder="프로필 사진"></td>
					</tr>
					<tr>
						<td style="text-align: center;"><label for="nickname"
							style="display: none">닉네임</label> <input type="text"
							name="nickname" placeholder="닉네임 입력"></td>
					</tr>
					<tr>
						<td style="text-align: center;"><label for="email"
							style="display: none">이메일</label> <input type="text" name="email"
							placeholder="이메일 입력"></td>
					</tr>
					<tr>
						<td style="text-align: center;"><label for="phone"
							style="display: none">전화번호</label> <input type="text"
							name="phone" placeholder="전화번호 입력"></td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<button type="submit">회원가입</button>
						</td>
					</tr>
				</table>
				</div>
		</form>
	</div>
	<div align="center" style="margin-bottom: 200px; border-radius: 8px;">
	</div>
</div>
<jsp:include page="../footer.jsp" />

