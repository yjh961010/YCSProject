<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>
<h1><span style="font-weight: bold; color:#054afa; font-family: 'Gothic A1', sans-serif;">공지사항 상세</span></h1>
    <table class="form-table">
        <tr>
            <td><input type="text" name="subject" value="${dto.title}" disabled></td>
        </tr>
        <tr>
            <td><textarea name="content" rows="10" cols="50" disabled>${dto.content}</textarea></td>
        </tr>
    <c:if test="${sessionScope.mbId.id == 'admin'}">
        <tr>
            <td class="button-container">
                <button style="color: white"; onclick="javascript: editNotice()">수정</button>
                <button style="color: white"; onclick="javascript: deleteNotice()">삭제</button>
            </td>
        </tr>
    </c:if>
    </table>
<jsp:include page="../footer.jsp"/>