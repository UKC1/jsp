package vote;

import java.sql.*;
import java.util.ArrayList;

public class VoteDao {
	private DBConnectionMgr pool;
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public VoteDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	// 설문 등록하기
	public boolean voteInsert(VoteList vlist, VoteItem vitem) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into votelist values(seq_vote.nextval, ?, ?, ?, sysdate, ?, default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion()); 
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();
			
			int result2 = 0;
			if(result == 1) {
				sql = "insert into voteitem values(seq_vote.currval, ?, ?, default)";
				pstmt = con.prepareStatement(sql);
				String item[] = vitem.getItem();
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals(""))
						break;
					
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);
					result2 = pstmt.executeUpdate();
				}				
			}
			if(result2 == 1)
				flag = true;
						
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 전체 설문 목록 가져오기
	public ArrayList<VoteList> getList() {
		ArrayList<VoteList> alist = new ArrayList<VoteList>();
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by num desc";
			/*
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			*/
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				VoteList vlist = new VoteList();
				vlist.setNum(rs.getInt(1));
				vlist.setQuestion(rs.getString(2));
				vlist.setSdate(rs.getString(3));
				vlist.setEdate(rs.getString(4));
				alist.add(vlist);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return alist;
	}
	
	// 설문 투표할 질문(1행) 가져오기
	public VoteList getOneVote(int num) {
		VoteList vlist = new VoteList();
		try {
			con = pool.getConnection();
			if(num == 0)
				sql = "select * from voteList order by num desc";
			else
				sql = "select * from voteList where num="+num;
			
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				vlist.setQuestion(rs.getString("question"));
				vlist.setType(rs.getInt("type"));
				vlist.setActive(rs.getInt("active"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt, rs);
		}	
		return vlist;
	}
	
	// 설문 투표할 질문의 item 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<String>();
		try {
			con = pool.getConnection();
			if(num == 0) {		// 사용자가 설문을 선택하지 않으면 num=0으로 넘겨줄것임
				num = getMaxNum();
			}
			sql = "select item from voteItem where listnum="+num;
			rs = con.createStatement().executeQuery(sql);
			
			while(rs.next()) {
				alist.add(rs.getString(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return alist;
	}
	
	// 투표로 count 증가
	public boolean updateCount(int num, String[] itemnum) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update VoteItem set count = count+1 where listnum=? and itemnum = ?";
			pstmt = con.prepareStatement(sql);
			if(num==0)
				num = getMaxNum();
			
			for(int i=0; i<itemnum.length; i++) {
				if(itemnum[i] == null || itemnum[i].equals(""))
					break;

				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				int result = pstmt.executeUpdate();
				if(result > 0) {
					flag = true;
				}
			}		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// listnum에 해당하는 전체count 얻어오기
	public int sumCount(int num) {
		int count = 0;
		try {
			con=pool.getConnection();
			sql = "select sum(count) from VoteItem where listnum = ?";
			pstmt = con.prepareStatement(sql);
			if(num == 0)
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	// listnum에 해당하는 각각의 item, count 값 얻어오기
	public ArrayList<VoteItem> getView(int num) {
		ArrayList<VoteItem> alist = new ArrayList<VoteItem>();
		try {
			con=pool.getConnection();
			sql = "select item, count from VoteItem where listnum = ?";
			pstmt = con.prepareStatement(sql);
			
			if(num == 0)
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VoteItem vitem = new VoteItem();
				String[] item = new String[1];
				item[0] = rs.getString(1);
				vitem.setItem(item);
				vitem.setCount(rs.getInt(2));
				alist.add(vitem);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	
	
	
	// voteList 중에서 num이 가장 큰값 얻어오기
	public int getMaxNum() {
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from voteList";
			/*
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			*/
			// 위의 2줄을 한줄로
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return maxNum;
	}
}