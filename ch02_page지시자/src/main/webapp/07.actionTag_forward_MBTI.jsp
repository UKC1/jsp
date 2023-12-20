<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>MBTI로 보는 당신의 성격테스트</H1>
	<form action="07_1.actionTag_forward_MBTI.jsp">
		이름 : <input name="name"><p/>
		MBTI 선택<P/>
		<input type="radio" name="mbti" value="intj">INTJ<br>
		<input type="radio" name="mbti" value="istp">ISTP<br>
		<input type="radio" name="mbti" value="entj">ENTJ<br>
		<input type="radio" name="mbti" value="esfj">ESFJ<br>
		<input type="submit">
	</form>
</body>
</html>