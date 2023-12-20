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
	나무보다 숲을 보려는 경향이 강하며 자신만의 세계가 뚜렷한 편이다<br>
	이성적이고 논리적, 분석적이며 객관적으로 사실을 판단한다<br>
	깔끔하게 정리정돈을 잘하며 뚜렷한 자기의사와 기준으로 신속하게 결론을 내린다<br>
</body>
</html>