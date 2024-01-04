<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="mem.MemberDao" />
<jsp:useBean id="bean" class="mem.Member" />
<jsp:setProperty name="bean" property="*" />
<%
	boolean result = mDao.insertMember(bean);
	String msg = "회원가입에 실패하였습니다";
	String location = "member.jsp";
	if(result) {
		msg = "회원가입이 되었습니다";
		location = "login.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	alert("<%=msg %>");
	location.href="<%=location %>";
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>