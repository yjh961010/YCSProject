<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="login-form" style="width: 35%; margin: auto; margin-top: 150px; height: 50%;">
	<h2 style="text-align: center">아이디찾기</h2>
	<form action="findid.do" method="post">
		<input type="text" name="name" placeholder="이름을 입력해주세요">
		<input type="text" name="phone" id="phone" placeholder="전화번호를 입력해주세요">
		<input type="text" name="certi" placeholder="인증번호를 입력해주세요" style="width: 60%;">
		<button type="button" onclick="subCertifi()" style="width: 30%; margin-left: 10px; padding: 7px;">인증번호발송</button>
		<button type="submit" style="width: 45%; margin-left: 15px;">인증번호확인</button>
		<button type="submit" style="width: 45%;">찾기</button>
	</form>
</div>
<script type="text/javascript">
	function subCertifi(){
		var csrfToken = $("meta[name='_csrf']").attr("content");
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		const phone = document.getElementById("phone").value;
		$.ajax({
			url : 'subCrtifi.ajax', 
			type : 'POST',
			data : phone,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(response) {
				console.log(response);
			},
			error : function(xhr, status, error) {
				console.error('주문 데이터 전송 실패:', error);
				console.error('상태 코드:', xhr.status);
				console.error('응답 텍스트:', xhr.responseText);
				// 오류 시 추가 작업 (예: 사용자에게 오류 메시지 표시 등)
			}
		}
		)
	}
</script>
<jsp:include page="../footer.jsp" />