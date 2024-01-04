package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public ReplyDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Reply> getReplyList(int ref) {
		ArrayList<Reply> alist = new ArrayList<Reply>();
		try {
			con = pool.getConnection();
			sql = "select * from reply where ref=? order by no desc";
			// sql = "select no,content,name,TO_CHAR(redate, 'YYYY-MM-DD') where ref=? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				/*
				Reply bean = new Reply();
				bean.setNo(rs.getInt("no"));
				bean.setContent(rs.getString("content"));
				bean.setRef(rs.getInt("ref"));
				bean.setName(rs.getString("name"));
				bean.setRedate(rs.getString("redate"));
				alist.add(bean);
				*/
				/*
				Reply bean = new Reply(rs.getInt(1)
				 					, rs.getString(2)
				 					, rs.getInt(3)
				 					, rs.getString(4)
				 					, rs.getString(5));
				alist.add(bean);
				*/
				
				alist.add(new Reply(rs.getInt(1)
					 		  , rs.getString(2)
					 		  , rs.getInt(3)
					 		  , rs.getString(4)
					 		  , rs.getString(5)));
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	public int insertReply(Reply bean) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "insert into reply values(seq_reply.nextval, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setInt(2, bean.getRef());
			pstmt.setString(3, bean.getName());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}	
}