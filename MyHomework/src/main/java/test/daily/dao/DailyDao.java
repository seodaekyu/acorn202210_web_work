package test.daily.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.daily.dto.DailyDto;
import test.util.DbcpBean;

public class DailyDao {
	
	private static DailyDao dao;
	
	static {
		if(dao==null) {
			dao = new DailyDao();
		}
	}
	
	private DailyDao() {}
	
	public static DailyDao getInstance() {
		
		return dao;
	}
	
	public int getCount() {
		int count = 0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool 에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) AS num FROM board_daily";

			pstmt = conn.prepareStatement(sql);
			//sql 문의 ? 에 바인딩 할게 있으면 한다.

			//SELECT 문을 수행하고 결과 값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				count = rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool 에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		return count;
	}
	
	public boolean addViewCount(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "UPDATE board_daily"
					+ " SET viewCount=viewCount+1"
					+ " WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			
			//INSERT or UPDATE or DELETE 문을 수행하고 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {}
		}
		return rowCount > 0 ? true : false;
		}
		
	
	public boolean delete(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "DELETE FROM board_daily"
					+ " WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			
			//INSERT or UPDATE or DELETE 문을 수행하고 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {}
		}
		return rowCount > 0 ? true : false;
		}
				
	
	
	public boolean update(DailyDto dto) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "UPDATE board_daily"
					+ " SET title=?, content=?"
					+ " WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			
			//INSERT or UPDATE or DELETE 문을 수행하고 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {}
		}
		return rowCount > 0 ? true : false;
		}
		
	
	
	public DailyDto getData(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		DailyDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool 에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT writer, title, content, viewCount, likeCount, regdate"
					+ " FROM board_daily"
					+ " WHERE num=?";

			pstmt = conn.prepareStatement(sql);
			//sql 문의 ? 에 바인딩 할게 있으면 한다.
			pstmt.setInt(1, num);
			//SELECT 문을 수행하고 결과 값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto = new DailyDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
	            dto.setViewCount(rs.getInt("viewCount"));
	            dto.setLikeCount(rs.getInt("likeCount"));
	            dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool 에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	public boolean insert(DailyDto dto) {
		
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO board_daily"
					+ " (num, writer, title, content, viewcount, likecount, regdate)"
					+ " VALUES(board_daily_seq.NEXTVAL, ?, ?, ?, 0, 0, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			//INSERT or UPDATE or DELETE 문을 수행하고 추가된 row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {}
		}
		return rowCount > 0 ? true : false;
		}
	
	public List<DailyDto> getList(DailyDto dto){
		
		List<DailyDto> list = new ArrayList<DailyDto>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT *"
	         		+ "FROM"
	         		+ "	(SELECT result1.*, ROWNUM AS rnum"
	         		+ "	FROM"
	         		+ "		(SELECT num, writer, title, viewCount, likeCount, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') AS regdate"
	         		+ "		FROM board_daily"
	         		+ "		ORDER BY num DESC) result1)"
	         		+ " WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기
	         pstmt.setInt(1, dto.getStartRowNum());
	         pstmt.setInt(2, dto.getEndRowNum());
	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            
	        	//select 된 row 하나의 정보를 DailyDto 객체를 생성해서 담고 
	            DailyDto tmp = new DailyDto();
	            tmp.setNum(rs.getInt("num"));
	            tmp.setWriter(rs.getString("writer"));
	            tmp.setTitle(rs.getString("title"));
	            tmp.setViewCount(rs.getInt("viewCount"));
	            tmp.setLikeCount(rs.getInt("likeCount"));
	            tmp.setRegdate(rs.getString("regdate"));
	            
	            //DailyDto 객체의 참조값을 List 에 누적 시키기
	            list.add(tmp);
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      return list;
	}



}
