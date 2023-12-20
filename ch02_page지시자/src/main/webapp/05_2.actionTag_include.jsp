<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String siteName = request.getParameter("siteName");
		String siteTel = request.getParameter("siteTel");
	%>
	include AcitonTag 포함되는 페이지 입니다<p/>
	<%=siteName %><p/>
	<%=siteTel %>
</body>
</html>