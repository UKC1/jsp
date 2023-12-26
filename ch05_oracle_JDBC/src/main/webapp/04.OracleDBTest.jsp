<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null; 
	int cnt = 0;
	String emp_id, emp_name, email, phone;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "aie", "aie");
		
		st = con.createStatement();
		rs = st.executeQuery("select * from employee");
%>
	employee테이블에서 모든 사원의
	emp_id, emp_name, email, phone
	을 검색하여 테이블로 보여주기
	레코드(행)가 몇개 인지 출력하기
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP를 이용한 ORACLE 연동</h1>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>전화번호</th>
		</tr>
		<%
		if(rs != null) {
			while(rs.next()) {
				emp_id = rs.getString(1);
				emp_name = rs.getString(2);
				email = rs.getString(4);
				phone = rs.getString(5);
				cnt++;
		%>
		<tr>
			<td><%=emp_id %></td>
			<td><%=emp_name %></td>
			<td><%=email %></td>
			<td><%=phone %></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<br>
	총 행의 갯수는 <%=cnt %>개 입니다.
</body>

<%
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) 
			try{rs.close(); } catch(Exception e) { }
		if (st != null) 
			try{st.close(); } catch(Exception e) { }
		if (con != null) 
			try{con.close(); } catch(Exception e) { }
	}
%>
</html>