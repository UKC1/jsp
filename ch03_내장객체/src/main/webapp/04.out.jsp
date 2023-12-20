<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page buffer="5kb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Out EX</h1>
	<%
		int totalBuffer = out.getBufferSize();
		int remaining = out.getRemaining();
		int useBuffer = totalBuffer - remaining; 
	%>
	<h3>현재 페이지의 Buffer 상태</h3>
	출력 Buffer의 전체 크기 : <%=totalBuffer %>byte<p/>
	남은 Buffer의 크기 : <%=remaining %>byte<p/>
	현재 Buffer의 사용량 : <%=useBuffer %>byte<p/>
	<%
		out.print("문자열<br>");
		out.print("두번째 문자열<br>");
		out.print("<h2>문자</h2>");
	%>
</body>
</html>