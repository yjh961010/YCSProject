<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="/css/qna/signup.css">
</head>
<body>
	<script type="text/javascript">
		function subForm() {
			const profile = document.getElementById("profile").value;
			if (profile == "") {
				alert("프로필 사진을 넣어주세요");
			} else {
				document.frm.submit();
			}
		}
	</script>
	<div align="center" style="margin-top: 50px;">
		<h1>
			<span style="font-weight: bold; color: #004d99;">회원가입</span>
		</h1>
		<div align="center" style="margin-top: 10px;">

			<table class="form-wrapper">
				<tr>
					<td>
						<form action="/member/signupPro.do" method="post"
							class="form-container" name="frm" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="signForm">
								<table>
									<tr>
										<td><label for="profile">프로필 사진</label>
											<div class="profile-upload">
												<input type="file" id="profile" name="file"
													accept="image/*" />
											</div></td>
									</tr>
									<tr>
										<td><label for="name">이름</label> <input
											type="text" id="name" name="name" placeholder="이름 입력(필수)"></td>
									</tr>
									<tr>
										<td><label for="memberID"
											>아이디</label> <input type="text"
											id="memberID" name="memberID" placeholder="아이디 입력(필수)">
										</td>
									</tr>
									<tr>
										<td><label for="password"
											>비밀번호</label> <input type="password"
											id="password" name="password" placeholder="비밀번호 입력(필수)">
										</td>
									</tr>
									<tr>
										<td><label for="nickname"
											>닉네임</label> <input type="text"
											id="nickname" name="nickname" placeholder="닉네임 입력"></td>
									</tr>
									<tr>
										<td><label for="email"
											>이메일</label> <input type="text"
											id="email" name="email" placeholder="이메일 입력"></td>
									</tr>
									<tr>
										<td><label for="phone"
											>전화번호</label> <input type="text"
											id="phone" name="phone" placeholder="전화번호 입력"></td>
									</tr>
									<tr>
										<td style="text-align: center;">
											<button type="button" onclick="subForm()">회원가입</button>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-bottom: 50px; border-radius: 8px;">
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
