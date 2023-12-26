<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch05.*" %>
<jsp:useBean id="regMgr" class="ch05.RegisterMgr6" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean을 이용한 ORACLE 연동</h1>
	<table border="1" align="center">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>급여</th>
			<th>입사일</th>
		</tr>
		<%
			ArrayList<EmployeeBean5> alist = regMgr.getEmpList();
			for(int i = 0; i< alist.size(); i++) {
				EmployeeBean5 bean = alist.get(i);
				String hireDate = bean.getHire_date().substring(0, 10);
			
		%>
		<tr>
			<td><%=bean.getEmp_id() %></td>
			<td><%=bean.getEmp_name() %></td>
			<td><%=bean.getEmail() %></td>
			<td><%=bean.getPhone() %></td>
			<td><%=bean.getSalary() %></td>
			<td><%=hireDate %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>

</html>