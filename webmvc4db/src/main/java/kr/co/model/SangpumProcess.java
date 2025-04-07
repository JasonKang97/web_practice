package kr.co.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.co.resourse.SqlMapConfig;

public class SangpumProcess {
	private SqlSessionFactory sessionFactory = SqlMapConfig.getSqlSession();
	
	public List<DataDto> selectSangpumAll(){
		List<DataDto> list = null;
		SqlSession sqlSession = sessionFactory.openSession();
		list = sqlSession.selectList("selectDataAll");
		sqlSession.close();
		return list;
	}
}
