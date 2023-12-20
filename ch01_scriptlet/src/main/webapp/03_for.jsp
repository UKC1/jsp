<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for문</title>
</head>
<body>
	<!-- 1~10합계 -->
	<%-- 
		<%
			int sum = 0;
			for(int i=1; i<=10; i++) {
				sum+=i;
			}
		%>
		1~10까지 합 = <%=sum %> 
	--%>
	<%
		int sum = 0;
		for(int i=1; i<=10; i++) {
			if(i<10) {
	%>
				<%=i %> +     <%-- <%=(i + "+") %>  --%>
	<%
			} else {
	%>
				<%=i %> =	 <%-- <%=(i + "=") %>  --%>
	<%
			}
			sum+=i;
		}
	%>
	<%=sum %>
	
	<br>
	
	<%
		sum = 0;
		for(int i=1; i<=10; i++) {
			if(i<10) {
				out.print(i + " + ");
			} else {
				out.print(i + " = ");
			}
			sum+=i;
		}
	%>
	<%=sum %>
</body>
</html>