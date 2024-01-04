<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>JSP VOTE</title>
<style>
	* {margin: 0 auto;}
	div {width:600px;}
	h2, h5 {text-align:center; }
	.m50 {margin-top:50px;}
	.m30 {margin-top:30px;}
	table th {text-align:center;}
	a {text-decoration:none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<div>
		<h2 class="m50">투표프로그램</h2>
		<p/>
		
		<h5 class="m30">설문작성</h5>
		<hr>
		<form method="post" action="voteInsertProc.jsp">
			<table class="table">
				<tr>
					<td>질문</td>
					<td colspan="2">q:<input name="question" size="40"></td>
				</tr>
				<tr>
					<td rowspan="7">항목</td>
				<%
				for(int i=1; i<=4 ; i++) {
					out.print("<td>"+ (i*2-1) + ":<input name='item'></td>");
					out.print("<td>"+ (i*2) + ":<input name='item'></td>");
					out.print("</tr>");
					if(i<4)
						out.print("<tr>");
				}
				%>
				<tr>
					<td>시작일</td>
					<td>
						<select name="sdateY">
							<option value="2023">2023
							<option value="2024">2024
						</select>년 
						<select name="sdateM">
							<%
								for(int i=1; i<=12; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>월 
						<select name="sdateD">
							<%
								for(int i=1; i<=31; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>일
					</td>
				</tr>
				<tr>
					<td>종료일</td>
					<td><select name="edateY">
							<option value="2023">2023
							<option value="2024">2024
						</select>년 
						<select name="edateM">
							<%
								for(int i=1; i<=12; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>월 
						<select name="edateD">
							<%
								for(int i=1; i<=31; i++) {
									out.print("<option value='" + i + "'>" + i);
								}
							%>
						</select>일
					</td>
				</tr>
				<tr>
					<td>이중답변</td>
					<td>
						<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<th colspan=3>
						<input type="submit" value="작성하기">&emsp;
						<input type="reset" value="다시쓰기">&emsp;
						<input type="button" value="리스트" onclick="location.href='voteList.jsp'">
					</th>
				</tr>	
			</table>
		</form>
	</div>
</body>
</html>







