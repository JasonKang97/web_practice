package pack.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import pack.order.OrderBean;



public class ProductManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ProductManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Driver 로딩 실패: " + e.getMessage());
		}
	}
	
	public ArrayList<ProductDto> getProductAll(){
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		try {
			conn = ds.getConnection();
			String sql = "select * from shop_product order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDto dto = new ProductDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setDetail(rs.getString("detail"));
				dto.setSdate(rs.getString("sdate"));
				dto.setStock(rs.getString("stock"));
				dto.setImage(rs.getString("image"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getProductAll err: " + e);
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
	
	
	public boolean insertProduct(ProductDto dto) {	// HttpServletRequest의 내장객체 이므로 이렇게 부를 수 있다.
		boolean b=false;
		try {
			conn = ds.getConnection();
			String sql = "insert into shop_product(name, price, detail, stock, image, sdate) values(?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getDetail());
			pstmt.setString(4, dto.getStock());
			pstmt.setString(5, dto.getImage()!=null?dto.getImage():"");
			
			int result = pstmt.executeUpdate();
			if(result>0) b=true;
		} catch (Exception e) {
			System.out.println("insertProduct err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
	public ProductDto getProduct(String no) {
		ProductDto dto = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from shop_product where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ProductDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setDetail(rs.getString("detail"));
				dto.setSdate(rs.getString("sdate"));
				dto.setStock(rs.getString("stock"));
				dto.setImage(rs.getString("image"));
			}
		} catch (Exception e) {
			System.out.println("getProduct err: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	
	public boolean updateProduct(ProductDto dto) {
		boolean b=false;
		try {
			conn = ds.getConnection();
			String sql = "update shop_product set name=?, price=?, detail=?, stock=?, image=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getDetail());
			pstmt.setString(4, dto.getStock());
			pstmt.setString(5, dto.getImage());
			pstmt.setInt(6, dto.getNo());
			
			int result = pstmt.executeUpdate();
			if(result>0) b=true;
			
		} catch (Exception e) {
			System.out.println("updateProduct err: " + e);
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
	public boolean deleteProduct(String no) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "delete from shop_product where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			if(pstmt.executeUpdate()>0) b=true;
			int result = pstmt.executeUpdate();
			if(result>0) b=true;
		} catch (Exception e) {
			System.out.println("updateProduct err: " + e);
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
	// 고객이 상품을 주문한 경우 주문 수 만큼 재고에서 빼기
	public void reduceProduct(OrderBean oBean) {
		try {
			conn = ds.getConnection();
			String sql = "update shop_product set stock=(stock-?) where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oBean.getQuantity());	// 주문 정보 DB에 저장
			pstmt.setString(2, oBean.getProduct_no());	// 주문 수량만큼 재고량에서 빼
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("reduceProduct err: " + e);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
