<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.addCookie(new Cookie("NAME","John"));
	response.addCookie(new Cookie("GENDER","Male"));
	response.addCookie(new Cookie("AGE","24"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Cookie를 사용하여 연결 유지</h1>
	쿠키를 만듭니다<p/>
	쿠키 내용을 보려면 <a href="02_2.cookie.jsp"> 클릭하세요 </a>
</body>
</html>