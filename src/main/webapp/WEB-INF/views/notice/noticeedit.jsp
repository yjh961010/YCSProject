<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>
<form method="post" action="/admin/updateNotice.do">
    <input type="hidden" name="notiid" value="${dto.id}">
    <h1><span style="font-weight: bold; color:#054afa; font-family: 'Gothic A1', sans-serif;">공지사항 수정</span></h1>
    <table class="form-table">
        <tr>
            <td><input type="text" name="subject" placeholder="제목을 입력해 주세요." value="${dto.title}"></td>
        </tr>
        <tr>
            <td><textarea name="content" placeholder="내용을 입력하세요." rows="10" cols="50">${dto.content}</textarea></td>
        </tr>
        <tr>
            <td class="button-container">
                <button style="color: white"; type="submit">등록</button>
                <button type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">공지사항 목록 보기</button>
            </td>
        </tr>

    </table>
</form>
</div>
<jsp:include page="../footer.jsp"/>