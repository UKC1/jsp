<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="jsp 현재페이지 정보"%>
<%@ page import="java.util.*" 
		 session="true" 
		 autoFlush="true" %>
<%@ page buffer="16kb" %>
<%@ page trimDirectiveWhitespaces = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Date date = new Date(); %>
	<%=this.getServletInfo() %>
	<p>현재 날짜와 시간은?</p>
	<%=date.toLocaleString() %>
</body>
</html>