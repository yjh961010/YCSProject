<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../header.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/noticeStyle.css">
     <div class ="notice-list">
            <h2>공지사항</h2><br>
                <div class="search-form">
                    <select id="searchType">
                        <option value="all">전체</option>
                        <option value="id">번호</option>
                        <option value="title">제목</option>
                    </select>
                        <input type="text" placeholder="검색어를 입력하세요" id="search">
                        <button onclick="">검색</button>
                </div>
     </div>
    <div class ="adminmode">
        <table class ="write-table">
            <tr>
<%--               <c:if test="${sessionScope.mbId.id == 'admin'}">--%>
<%--               --%>
                    <td align="right">
                        <a href="${pageContext.request.contextPath}/notice/insertnotice.do" class="write-btn">글쓰기</a>
                    </td>
<%--                </c:if>--%>
            </tr>
        </table>
    </div>
    <table class="notice-table">
        <thead>
            <tr class="notice-header">
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
            <tbody>
            <c:if test="${empty noticeList}">
                <tr>
                    <td colspan="4" class="no-data">등록된 공지글이 없습니다.</td>
                </tr>
            </c:if>
            <c:forEach var="dto" items="${noticeList}">
                <tr class="notice-row">
                    <td align="center">${dto.id}</td>
                    <td align="left">
                        <a href="content_notice.do?id=${dto.id}" class="notice-link">${dto.title}</a>
                    </td>
                    <td align="center">${dto.author}</td>
                    <td align="center">${dto.createTime}</td>
                </tr>
            </c:forEach>
            </tbody>
    </table>
<jsp:include page="../footer.jsp"/>
