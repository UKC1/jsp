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
	String id = (String)session.getAttribute("idKey");
	if(id == null) {	
	%>
		<script type="text/javascript">
			alert("로그인이 되지 않았습니다");
			location.href="05.sessionLogin.jsp";
		</script>
	<% 
	} else {
	%>
	<h2>session 로그인</h2>
	<h3><%=id %>님이 로그인 하였습니다</h3>
	<a href="05_4.sessionLogout.jsp">로그아웃</a>
	<% 
	}
%>
</body>
</html>