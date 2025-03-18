package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Jspex17DBCP {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public Jspex17DBCP() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");	
		} catch (Exception e) {
			System.out.println("Jspex17DBCP err: " + e);
		}
	}
	
	public ArrayList<Jspex17Dto> getDataAll() {
		ArrayList<Jspex17Dto> list = new ArrayList<Jspex17Dto>();
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select * from guestbook order by code desc");
			ResultSet rs=pstmt.executeQuery();
		){
			while(rs.next()) {
				Jspex17Dto dto = new Jspex17Dto();
				dto.setCode(rs.getString("code"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getDataAll err: " + e);
		}
		return list;
	}

	
	public boolean insertData(Jspex17Dto dto) {
		boolean b = false;
		try {
			
			conn=ds.getConnection();
			// 신상 code 구하기
			String sql = "select max(code) as max from guestbook";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int maxCode = 0;
			if(rs.next()) {
				maxCode = rs.getInt("max");
			}
			maxCode +=1;
			
			// 추가
			sql = "insert into guestbook(code, writer, title, contents) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxCode);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContents());
			int result = pstmt.executeUpdate();
			if(result == 1) b = true;
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return b;
	}
	
	public boolean deleteData(String code) {
		boolean b = false;
		String sql = "delete from guestbook where code=?";
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);	
		){
			pstmt.setString(1, code);
			if(pstmt.executeUpdate()>0) b = true;
		} catch (Exception e) {
			System.out.println("deleteData err: " + e);
		}
		return b;
	}
	
	public Jspex17Dto updateDataRead(String code) {
		Jspex17Dto dto = null;
		
		String sql = "select * from guestbook where code=?";
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)
			){
			pstmt.setString(1, code);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new Jspex17Dto();
				dto.setCode(rs.getString("code"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
			}
		} catch (Exception e) {
			System.out.println("updateDataRead err: " + e);
		}
		return dto;
	}
	
	public boolean updateData(Jspex17Dto dto) {
		boolean b = false;
		
		String sql = "update guestbook set writer=?, title=?, contents=? where code=?";
		
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents());
			pstmt.setString(4, dto.getCode());
			if(pstmt.executeUpdate()>0) b = true;
		} catch (Exception e) {
			System.out.println("updateData err: " + e.getMessage());
		}
		return b;
	}
}
