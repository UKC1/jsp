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
	if(id != null) {
	%>
		<h2>session 로그인</h2>
		<h3><%=id %>님이 로그인 하였습니다</h3>
		<a href="05_4.sessionLogout.jsp">로그아웃</a>
	<%
	} else {
	%>
	
	<h1>Session 로그인</h1>
	<form method="post" action="05_2.sessionLoginProc.jsp">
		<table border="1" align="center" width="300px" style="border-collapse:collapse">
			<tr>
				<th colspan="2">Login</th>
			</tr>
			<tr>
				<td width="30%" align="center">ID</td>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td align="center">PW</td>
				<td><input type="password" name="pwd" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="login">&emsp;
					<input type="reset" value="reset">
				</td>
			</tr>
		</table>
	</form>
<%
	}
%>
</body>
</html>