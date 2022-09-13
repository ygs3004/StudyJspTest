<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>join.jsp</title>
</head>
<body>
<br><br><br><br>
<form action="join.do" method="post">
    <table align="center">
        <tr>
            <th>아이디</th>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pw"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>성별</th>
            <td>
                 <input type="radio" value="남" name="gender" checked>남</input>
                 <input type="radio" value="여" name="gender">여</input>
            </td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td><input type="text" name="phone"></td>
        </tr>
        <tr>
            <th>email</th>
            <td><input type="text" name="email"></td>
        </tr>
    </table>
    <div align="center">
        <input type="submit" value="가입">
        <input type="reset" value="취소">
        <input type="button" value="로그인 화면으로" onclick="location.href='main.do'">
    </div>
</form>
</body>
</html>
