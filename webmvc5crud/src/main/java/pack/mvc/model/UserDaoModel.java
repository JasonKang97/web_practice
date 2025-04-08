package pack.mvc.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class UserDaoModel {	// userinfo 테이블 관련 Business Logic
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public UserDaoModel() {
		
	}
	
	public ArrayList<UserDto> getUserAll(){
		List<UserDto> list =null;
		SqlSession sqlSession = factory.openSession();
		try {
			list= sqlSession.selectList("selectDataAll");
		} catch (Exception e) {
			System.out.println("getUserAll err: " + e);
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return (ArrayList<UserDto>)list;
	}
	
	public UserDto findUser(String userid) {
		UserDto dto = null;
		SqlSession sqlSession = factory.openSession();
		try {
			dto = sqlSession.selectOne("findUser", userid);
		} catch (Exception e) {
			System.out.println("findUser err: " + e);
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return dto;
	}
}
