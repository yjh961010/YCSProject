<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
<h2>회원정보수정</h2>
<div>
Grade : ${member.grade}
MemberID:${member.memberID}
Name:${member.name}
ProFile:${member.profile}
NickName:${member.nickname}
Eamil:${member.email}
Phone:${member.phone} <br>
수정 / 삭제
</div>

<jsp:include page="../footer.jsp"/>