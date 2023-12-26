<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="mem.MemberDao" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean result = mDao.loginMember(id, pwd);
	
	String msg = "로그인에 실패하였습니다.";
	if(result) {
		session.setAttribute("idKey", id);
		msg = "로그인 되었습니다";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg %>");
	location.href="login.jsp";
</script>
</head>
<body>

</body>
</html>