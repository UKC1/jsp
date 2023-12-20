<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String mbti = request.getParameter("mbti");		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%=name %></b>님의 MBTI는 <b><%=mbti %><b>입니다<p/>
	성격은 내향적이며 <br>
	숲보다 나무를 보려는 경향이 강하다.<br>
	이성적이고 논리적, 분석적이며 객관적으로 사실을 판단한다<br>
	상황에 따라 적응하며 결정을 보류한다
</body>
</html>