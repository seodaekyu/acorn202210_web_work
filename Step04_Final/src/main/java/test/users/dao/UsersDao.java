package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	//외부에서 객체 생성할 수 없도록
	private UsersDao() {}
	//참조 값을 리턴해주는 static 메소드
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	
	//인자로 전달되는 dto에 있는 id, pwd를 이용해서 해당 정보가 유효한지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//id pwd 유효 여부를 담을 변수를 만들고 초기 값 false 부여하기
		boolean isExist = false;
		
		try {
			//Connection Pool 에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT * FROM users"
					+ " WHERE id=?"
					+ " and pwd=?";

			pstmt = conn.prepareStatement(sql);
			//sql 문의 ? 에 바인딩 할게 있으면 한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//SELECT 문을 수행하고 결과 값을 받아온다.
			rs = pstmt.executeQuery();
			//SELECT 된 row 가 있는지 확인해본다.
			if (rs.next()) {
				//SELECT된 row가 있다면 유효한 정보가 맞다.
				isExist = true;
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
		return isExist;
	}
	
	//회원 한명의 정보를 DB에 저장하고 성공여부를 리턴하는 메소드
	public boolean insert(UsersDto dto) {//UsersDto에 id,pwd,email이 있다.
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			
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
	
	
	
	
	
	}
