<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(id != null) { %>
	<b><%=id %></b>님 환영합니다.
	<p>즐거운 하루 되세요</p>
	<a href="logout.jsp">로그아웃</a>
<% } else { %>
	<h3 align="center">로그인</h3>
	<form method="post" action="loginProc.jsp">
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
					<input type="submit" value="로그인">&emsp;
					<input type="reset" value="초기화">&emsp;
					<input type="button" value="회원가입" onclick="location.href='member.jsp'">
				</td>
			</tr>
		</table>
	</form>
<% } %>
</body>
</html>