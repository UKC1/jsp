<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Forward Tag Ex1 맨마지막 페이지</h1>
	당신의 아이디는 <b><%=id %></b>이고, <br>
	패스워드는 <b><%=pw %></b>입니다.
</body>
</html>