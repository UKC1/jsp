<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch06.RegisterMgr" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	
	if(regMgr.login(id, pw)) {
		Cookie cookie = new Cookie("idKey", id);
		response.addCookie(cookie);
		%>
		<script type="text/javascript">
			alert("로그인이 되었습니다");
			location.href="04_3.cookieLoginOK.jsp";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("로그인이 되지 않았습니다");
			location.href="04.cookieLogin.jsp";
		</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>