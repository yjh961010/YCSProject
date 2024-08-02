<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../header.jsp"/>
<h1><span style="font-weight: bold; color:#054afa; font-family: 'Gothic A1', sans-serif;">공지사항 등록</span></h1>
<div class="container">
    <form action ="/notice/insertNotice.do" method="post"  onsubmit="return check();">
        <table class="form-table">
            <tr>
                <td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
                <td><textarea name="content" rows="10" cols="50" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <td>
                <div>
                    <button type="submit" align="center">등록</button>
                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'">공지사항 목록 보기</button>
                </div>
            </td>
        </table>
    </form>
</div>
<jsp:include page="../footer.jsp"/>
