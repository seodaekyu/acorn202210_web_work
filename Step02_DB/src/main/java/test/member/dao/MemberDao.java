package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//자신의 참조 값을 지정할 static 필드(하나만 만들어 놓고 사용 할 예정)
	private static MemberDao dao;
	
	
	//외부에서 객체 생성하지 못하도록 생성자의 접근지정자를 private 으로 쓴다.
	private MemberDao() {}
	
	//자신의 참조 값을 리턴하는 static 메소드를 제공한다.
	public static MemberDao getInstance() {
		//만일 최초 호출이라면 자신의 객체를 생성해서 static 필드에 담아둔다.
		if(dao==null) {
			dao = new MemberDao();
		}
		//필드에 있는 자신의 참조 값을 리턴해준다.
		return dao;
	}
	
	//전체 회원의 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		//회원 목록을 담을 객체 생성
		List<MemberDto> list = new ArrayList<>();
		
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool 에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT num, name, addr"
					+ " FROM member"
					+" ORDER BY num ASC";
			//sql 문의 ? 에 바인딩 할게 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			//SELECT 문을 수행하고 결과 값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList 객체에 누적시킨다.
				list.add(dto);
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
		
		return list;
	}
	  //회원 한명의 정보를 DB에 저장하는 메소드
	  public boolean insert(MemberDto dto) {
		  
	      //필요한 객체를 담을 지역변수를 미리 만들어 둔다.
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int rowCount = 0;
	      try {
	         //Connection Pool에서 Connection 객체를 하나 얻어온다.
	         conn = new DbcpBean().getConn();
	         //실행할 sql문의 뼈대 구성하기
	         String sql = "INSERT INTO member"
	               + " (num, name, addr)"
	               + " VALUES(member_seq.NEXTVAL, ?, ?)";
	         
	         pstmt = conn.prepareStatement(sql);
	         //sql문의 ?에 바인딩 할게 있으면 바인딩하기
	         pstmt.setString(1, dto.getName());
	         pstmt.setString(2, dto.getAddr());
	         
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
	  
	  	// 회원 한명의 정보를 삭제하고 작업의 성공 여부를 리턴해주는 메소드
		public boolean delete(int num) {
			Connection conn = null;
	     	PreparedStatement pstmt = null;
	     	// 수정된 row 의 갯수를 담을 지역변수를 미리 만들고 초기 값 0 대입하기
	     	int rowCount = 0;
		      try {
		         // Connection 객체의 참조값 얻어오기
		         conn = new DbcpBean().getConn();
		         // 실행할 미완성의 sql 문
		         String sql = "DELETE FROM member"
		        		 + " WHERE num=?";

		         // PreparedStatement 객체의 참조값 얻어오기
		         pstmt = conn.prepareStatement(sql);
		         // ? 에 값 바인딩하기
		         pstmt.setInt(1, num);
		         // sql 문 실행하고 변경된(추가, 수정, 삭제) row 의 갯수를 리턴받기
	             rowCount = pstmt.executeUpdate();
		      }catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         try {
		            if(pstmt!=null)pstmt.close();
		            if(conn!=null)conn.close();
		         }catch(Exception e) {}
		      }
		      // 변화된 rowCount 값 확인해서 작업의 성공 여부를 리턴해준다.
		      return rowCount>0? true:false;
		      
		}
		
		//회원 한명의 정보를 리턴하는 메소드
		public MemberDto getData(int num) {
			
			MemberDto dto = null;
			
			//필요한 객체를 담을 지역변수를 미리 만들어둔다.
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				//Connection Pool 에서 Connection 객체를 하나 얻어온다.
				conn = new DbcpBean().getConn();
				//실행할 sql 문의 뼈대 구성하기
				String sql = "SELECT name, addr"
						+ " FROM member"
						+ " WHERE num=?";
				
				pstmt = conn.prepareStatement(sql);
				//sql 문의 ? 에 바인딩 할게 있으면 한다.
				pstmt.setInt(1, num);
				
				//SELECT 문을 수행하고 결과 값을 받아온다.
				rs = pstmt.executeQuery();
				//만일 select 된 row가 있다면 (커서 다음에 select 된 row가 있다면)
				if (rs.next()) {
					//MemberDto 객체를 생성해서 회원 한명의 정보를 담는다.
					dto = new MemberDto();
					dto.setNum(num);
					dto.setName(rs.getString("name"));
					dto.setAddr(rs.getString("addr"));
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
		
		//회원 한명의 정보를 수정 반영하는 메소드
		public boolean update(MemberDto dto) {
			//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
			try {
				//Connection Pool에서 Connection 객체를 하나 얻어온다.
				conn = new DbcpBean().getConn();
				//실행할 sql문의 뼈대 구성하기
				String sql = "UPDATE member"
						+ " SET name=?, addr=?"
						+ " WHERE num=?";
				
				pstmt = conn.prepareStatement(sql);
				//sql문의 ?에 바인딩 할게 있으면 바인딩하기
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getAddr());
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
}
