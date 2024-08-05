<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content.jsp -->
<!DOCTYPE html>
<jsp:include page="../header.jsp"/>
<div align="center">
	<b>글내용 보기</b>
	<table border="1" width="100%">
		<tr>
			<th width="20%" bgcolor="yellow">글번호</th>
			<td align="center">${getCommu.id}</td>
			<th width="20%" bgcolor="yellow">조회수</th>
			<td align="center">${getCommu.views}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">작성자</th>
			<td align="center">${getCommu.author}</td>
			<th width="20%" bgcolor="yellow">작성일</th>
			<td align="center">${getCommu.createtime}</td>
		</tr> 
		<tr>
			<th width="20%" bgcolor="yellow">글제목</th>
			<td align="left" colspan="3">${getCommu.subject}</td>
		</tr>
		<tr>
			<th width="20%" bgcolor="yellow">글내용</th>
			<td align="left" colspan="3">${getCommu.content}</td>
		</tr>
		<tr bgcolor="yellow">
			<td align="right" colspan="4">
				<input type="button" value="답글달기"
				onclick="window.location='/commu/commuWrite.do?id=${getCommu.id}'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글수정"
				onclick="window.location='/commu/commuUpdate.do?id=${getCommu.id}'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" 
				onclick="window.location='/commu/commuDelete.do?id=${getCommu.id}'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='/commu/commuList.do'">
			</td>
		</tr>
	</table>
</div>


<jsp:include page="../footer.jsp"/>






