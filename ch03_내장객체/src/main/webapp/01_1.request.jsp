<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String sNum = request.getParameter("studentNum");
	String gen = request.getParameter("gender");
	String major = request.getParameter("major");
	String[] hobby = request.getParameterValues("hobby");
	
	if(gen.equals("M")) {
		gen = "남자";
	} else {
		gen = "여자";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%=name %><p/>
	학번 : <%=sNum %><p/>
	성별 : <%=gen %><p/>
	학과 : <%=major %><p/>
	취미 :
	<%
	for(int i=0; i<hobby.length; i++) {
		out.print(hobby[i]+", ");
	}
	%>
	입니다
</body>
</html>