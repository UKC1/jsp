package ch06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RegisterMgr {
	private DBConnectionMgr pool = null;
	
	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("커넥션 얻어오기 실패");
		}
	}
	
	// 내가 필요한 select, insert, delete, update등을 메소드로 정의
	public boolean login(String id, String pw) {
		boolean loginFlag = false;
		try {
			Connection con = pool.getConnection();
			String query = "select count(*) from member where mem_id=? and mem_pw=?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, id);
			st.setString(2, pw);
			ResultSet rs = st.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) 
				loginFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return loginFlag;
	}	
}