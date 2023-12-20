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
		request.setCharacterEncoding("UTF-8");
		String msg = request.getParameter("msg");
		int count = Integer.parseInt(request.getParameter("count"));
		
		int num = 0;
		while(count > num) {
			out.print(msg+"<br>");
			num++;
		}
	%>
</body>
</html>