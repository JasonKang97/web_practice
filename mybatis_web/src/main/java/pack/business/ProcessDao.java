package pack.business;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class ProcessDao {	// Business Logic


	private SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	public List<SangpumDto> selectDataAll() throws SQLException{	// 전체 자료 읽기
		// SqlSession: DataMapper.xml에 정의된 id에 접근 가능
		SqlSession sqlSession = sqlSessionFactory.openSession();	// sqlSession 객체 생성 후 열기
		List<SangpumDto> list = sqlSession.selectList("selectDataAll");
		sqlSession.close();
		return list;
	}
	
	public SangpumDto selectDataPart(String code) throws SQLException{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SangpumDto dto = sqlSession.selectOne("selectDataByCode", code);
		sqlSession.close();
		return dto;
	}
	
	public void insertData(SangpumBean bean) throws SQLException{
		/*
		SqlSession sqlSession = sqlSessionFactory.openSession();	// 수동 commit: transaction에서 commit이나 rollback이 필요
		sqlSession.insert("insertData", bean);
		sqlSession.commit();	// sqlSession.rollback();
		sqlSession.close();
		*/
		SqlSession sqlSession = sqlSessionFactory.openSession(true);	// 자동 commit상태. false나 빈칸일 경우 수동 commit
		sqlSession.insert("insertData", bean);
		sqlSession.close();
	}
	
	public void upData(SangpumBean bean) throws SQLException{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update("updateData", bean);
		sqlSession.close();
	}
	
	public boolean delData(String code) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean b = false;
		try {
			int count = sqlSession.delete("deleteData", code);
			if(count>=0) b=true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("delData err: " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
}
