<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="../header.jsp"/>
<div align="center">
	<h3>고 객 지 원</h3>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right">
				<a href="/qna/qnaWrite.do">글쓰기</a>
			</td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="30%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th> 
			
		</tr>
	<c:if test="${empty qnaList}">		
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${qnaList}">
		<tr>
			<td align="center">${dto.id}</td>
			<td align="left">
				<a href="/qna/qnaContent.do?id=${dto.id}">${dto.subject}</a>
				<c:if test="${dto.views > 10}">
					<img src="img/hot.gif">
				</c:if>
			</td>
			<td align="center">${dto.author}</td>
			<td align="center">${dto.createtime}</td>
			<td align="right">${dto.views}</td>
		</tr>	
	</c:forEach>		
	</table>
</div>
<jsp:include page="../footer.jsp"/>
