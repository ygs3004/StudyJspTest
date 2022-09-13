<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>joinSuccess</title>
</head>
<body>
<%
    String name = (String)request.getAttribute("name");
%>
<%=name%>님 회원가입에 성공하셨습니다.
<a href="index.jsp">처음으로</a>
</body>
</html>
