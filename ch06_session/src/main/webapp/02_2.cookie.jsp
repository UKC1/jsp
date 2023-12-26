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
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			out.print("Cookie Name : " + cookies[i].getName() + "<p/>");
			out.print("Cookie Value : " + cookies[i].getValue() + "<hr>");
		}
	}
%>
</body>
</html>