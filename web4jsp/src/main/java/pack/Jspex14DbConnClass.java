package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Jspex14DbConnClass {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public int number=0;
	public Jspex14DbConnClass() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (Exception e) {
			System.out.println("DbConnClass err: " + e);
		}
	}
	
	public ArrayList<Jspex14JikwonDto> getDataAll(String busername){
		ArrayList<Jspex14JikwonDto> list = new ArrayList<Jspex14JikwonDto>();
		try {
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/test", "root", "123");
			String sql = "select jikwonno, jikwonname, jikwonjik, jikwongen from jikwon INNER JOIN buser ON busernum=buserno where busername=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, busername);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				Jspex14JikwonDto dto = new Jspex14JikwonDto();
				dto.setJikwonno(rs.getString("jikwonno"));
				dto.setJikwonname(rs.getString("jikwonname"));
				dto.setJikwonjik(rs.getString("jikwonjik"));
				dto.setJikwongen(rs.getString("jikwongen"));
				list.add(dto);
				number++;
			}				
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}	
}
