<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if문 처리</title>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String msg = "";
	/*
	switch(color) {
	case "blue":
		msg = "파란색";
		break;
	case "red":
		msg = "빨간색";
		break;
	case "orange":
		msg = "오렌지색";
		break;
	case "etc":
		msg = "기타";
		color = "green";
		break;
	}
	*/
	
	if(color.equals("blue")) {
		msg="파란색";
	} else if(color.equals("red")) {
		msg="빨간색";
	} else if(color.equals("orange")) {
		msg="오렌지색";
	} else {
		msg ="기타";
		color = "green";
	}
%>
</head>
<body bgcolor = "<%=color%>">
	<%=name %>님 반갑습니다<br>
	당신이 좋아하는 색상은 <%=msg %>이군요
</body>
</html>