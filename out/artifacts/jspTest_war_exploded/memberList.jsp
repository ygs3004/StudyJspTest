<%@ page import="dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>memberList</title>
</head>
<body>
<br><br><br><br>
<%
    request.setCharacterEncoding("UTF-8");
%>
<table align="center">
    <tr>
        <td>ID</td>
        <td>비밀번호</td>
        <td>이름</td>
        <td>성별</td>
        <td>전화번호</td>
        <td>이메일</td>
        <td>수정</td>
        <td>삭제</td>
    </tr>
    <c:forEach var="member" items="${memberlist}">
    <tr>
        <td>${member.id}</td>
        <td>${member.pw}</td>
        <td>${member.name}</td>
        <td>${member.gender}</td>
        <td>${member.phone}</td>
        <td>${member.email}</td>
        <td><a href="${pageContext.request.contextPath}/update.do?id=${member.id}">정보 수정</a></td>
        <td><a href="${pageContext.request.contextPath}/delete.do?id=${member.id}">정보 삭제</a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
