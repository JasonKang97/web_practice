package pack.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MemberManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Driver 로딩 실패: " + e.getMessage());
		}
	}
	
	// 동이름으로 우편자료 검색
	public ArrayList<ZipcodeDto> zipcodeRead(String dongName){
		ArrayList<ZipcodeDto> list = new ArrayList<ZipcodeDto>();
		try {
			conn = ds.getConnection();
			String sql="select * from ziptab where area3 like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dongName + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeDto zipcodeDto = new ZipcodeDto();
				zipcodeDto.setZipcode(rs.getString("zipcode"));
				zipcodeDto.setArea1(rs.getString("area1"));
				zipcodeDto.setArea2(rs.getString("area2"));
				zipcodeDto.setArea3(rs.getString("area3"));
				zipcodeDto.setArea4(rs.getString("area4"));
				list.add(zipcodeDto);
			}
		} catch (Exception e) {
			System.out.println("zipcodeRead err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
