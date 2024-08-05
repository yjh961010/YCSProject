<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
<title>회원관리</title>
 	<div>
 	<form name="f" action ="searchMember.do">
 	<select id="searchMember">
      <option value="all">전체</option>
      <option value="id">Id</option>
      <option value="nickname">닉네임</option>
    </select>
  <input type="text" placeholder="Id혹은 닉네임으로 검색해주세요" id="search">
    <input type="submit" value ="검색">
    </form>
    </div>
    <c:if test="${empty mList}">
    회원이 존재하지 않습니다.
    </c:if>
    <c:if test="${not empty mList}">
    <c:forEach var="dto" items="${mList}">
   	ID:${dto.memberid}
    이름:${dto.name}
    전화번호:${dto.phone}
    닉네임:${dto.nickname}
    이메일:${dto.email}
    <br>
    </c:forEach>
    </c:if>
    





<jsp:include page="../footer.jsp"/>