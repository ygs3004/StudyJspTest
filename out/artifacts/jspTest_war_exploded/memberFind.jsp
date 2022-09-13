<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="header.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>memberFind</title>
</head>
<body>
<br><br><br>
    <div align="center">
        <h3>회원 정보 찾기</h3>
        <form action="find.do" method="post">
            ID <input type="text" name="id">
            <input type="submit" value="전송">
        </form>
    </div>
</body>
</html>