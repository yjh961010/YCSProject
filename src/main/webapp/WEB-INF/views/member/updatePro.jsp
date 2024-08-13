<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="login-form" style="width: 35%; margin: auto; margin-top: 150px; height: 50%;">
	<h2 style="text-align: center">비밀번호변경하기</h2>
	<form action="updatepw.do" method="post" name="frm">
		<input type="hidden" name="memberID" value="${member.memberID}">
		<input type="text" name="passwd" placeholder="이름을 입력해주세요">
		<input type="text" name="memberID" placeholder="아이디를 입력해주세요">
		<button type="button" onclick="sub()">변경하기</button>
	</form>
</div>
<script>
	function sub(){
		
	}
</script>
<jsp:include page="../footer.jsp" />