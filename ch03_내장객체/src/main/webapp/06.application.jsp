<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String serverInfo = application.getServerInfo();
	String mimeType = application.getMimeType("01.request.html");
	// url경로
	String appPath = application.getContextPath();
	// 웹 애플리케이션 루트에 대한 로컬상의 실제 경로
	String realPath = application.getRealPath("/");
	application.log("application 내부 객체 로그 테스트");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Application EX</h1>
	서블릿 컨테이너의 이름과 버전 : <%=serverInfo %><p/>
	'01.request.html'파일의 MIME Type : <%=mimeType %><p/>
	웹 어플리케이션의 URL경로명 : <%=appPath %><p/>
	로컬 파일 시스템의 경로명 : <%=realPath %>
</body>
</html>