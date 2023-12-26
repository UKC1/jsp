package ch05;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RegisterMgr6 {
	private DBConnectionMgr pool = null;
	
	public RegisterMgr6() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("커넥션 얻어오기 실패");
		}
	}
	
	// 메소드로 select, insert, delete, update등을 메소드로 정의
	public ArrayList<EmployeeBean5> getEmpList() throws Exception {
		ArrayList<EmployeeBean5> alist = new ArrayList<EmployeeBean5>();
		
		try {
			Connection con = pool.getConnection();	
			// Exception 처리 안하면 에러 발생
			Statement st = con.createStatement();
			String query = "select emp_id, emp_name, email, phone, salary, hire_date from employee";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				EmployeeBean5 bean = new EmployeeBean5();
				bean.setEmail(rs.getString("email"));
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setHire_date(rs.getString("hire_date"));
				bean.setSalary(rs.getInt("salary"));
				bean.setPhone(rs.getString("phone"));
				
				alist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return alist;
	}
	
	
}
