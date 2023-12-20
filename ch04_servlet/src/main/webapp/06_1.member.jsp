<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="ch04.MemberBean"/>
<jsp:setProperty name="member" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="memberInsert">
	<jsp:getProperty name="member" property="name" />회원님이 작성한 내용입니다. 확인해주세요<p/>
	아이디 : <jsp:getProperty name="member" property="id" /><p/>
	패스워드 : <jsp:getProperty name="member" property="pwd" /><p/>
	생년월일 : <jsp:getProperty name="member" property="birthday" /><p/>
	이메일 : <jsp:getProperty name="member" property="email" /><p/>
	<input type="submit" value="확인완료">
	<input type="button" value="다시쓰기" onclick="history.back();">
	</form>
</body>
</html>