<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>memberFindSuccess</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
    <h3 align="center">${member.name}님의 회원정보</h3>
    <form action="update.do" method="post">
        <table align="center">
            <tr>
                <th>아이디 : </th>
                <td>${member.id}<input type="hidden" name="id" value="${member.id}"></td>
            </tr>
            <tr>
                <th>비밀번호 : </th>
                <td><input type="text" name="pw" value="${member.pw}"></td>
            </tr>
            <tr>
                <th>이름 : </th>
                <td><input type="text" name="name" value="${member.name}"></td>
            </tr>
            <tr>
                <th>성별 : </th>
                <td>
                    <c:choose>
                        <c:when test='${member.gender == "남"}'>
                            <input type="radio" value="남" name="gender" checked>남자</input>
                            <input type="radio" value="여" name="gender">여자</option>
                        </c:when>
                        <c:otherwise>
                            <input type="radio" value="남" name="gender">남자</input>
                            <input type="radio" value="여" name="gender" checked >여자</option>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>전화번호 : </th>
                <td><input type="text" name="phone" value="${member.phone}"></td>
            </tr>
            <tr>
                <th>email : </th>
                <td><input type="text" name="email" value="${member.email}"></td>
            </tr>
        </table>
        <div align="center">
            <input type="submit" value="수정">
            <input type="button" value="삭제" onclick="location.href='/delete.do?id=${member.id}'">
        </div>
    </form>
</body>
</html>
