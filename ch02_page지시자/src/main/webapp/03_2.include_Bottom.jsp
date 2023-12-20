<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	include 지시자의 Bottom부분 입니다<p/>
	<% Date date = new Date(); %>
	<%=date.toLocaleString() %>
</body>
</html>