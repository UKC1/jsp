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
	성격은 외향적이며 숲보다 나무를 보려는 경향이 강하다<br>
	이성보단 감정에 치우치며,<br>
	뚜렷한 자기의사와 기준으로 신속하게 결론을 내린다
</body>
</html>