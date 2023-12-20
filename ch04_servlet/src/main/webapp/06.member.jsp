<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="script.js" charset="UTF-8"></script>
<style>
	* {margin:0 auto;}
</style>
</head>
<body>
	<table border="1" width="800px">
		<form method="post" name="regForm" action="06_1.member.jsp">
			<tr>
				<th colspan="3">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
				<td>영문과 숫자로만 5글자 이상</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd"></td>
				<td>영문, 숫자, 특수기호를 반드시 1개이상씩 포함하여 9글자 이상</td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" name="repwd"></td>
				<td>영문, 숫자, 특수기호를 반드시 1개이상씩 포함하여 9글자 이상</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
				<td>한글이름</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birthday"></td>
				<td>예) 23-12-19</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
				<td>예) email@naver.com</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>