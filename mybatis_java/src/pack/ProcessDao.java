package pack;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProcessDao {	// Business Logic
	private static ProcessDao processDao = new ProcessDao();
	
	public static ProcessDao getInstance() {	// singleton 패턴
		return processDao;
	}

	private SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	public List<DataDto> selectDataAll() throws SQLException{	// 전체 자료 읽기
		// SqlSession: DataMapper.xml에 정의된 id에 접근 가능
		SqlSession sqlSession = sqlSessionFactory.openSession();	// sqlSession 객체 생성 후 열기
		List<DataDto> list = sqlSession.selectList("selectDataAll");
		sqlSession.close();
		return list;
	}
	
	public DataDto selectDataPart(String code) throws SQLException{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		DataDto dto = sqlSession.selectOne("selectDataByCode", code);
		sqlSession.close();
		return dto;
	}
	
	public void insertData(DataDto dto) throws SQLException{
		/*
		SqlSession sqlSession = sqlSessionFactory.openSession();	// 수동 commit: transaction에서 commit이나 rollback이 필요
		sqlSession.insert("insertData", dto);
		sqlSession.commit();	// sqlSession.rollback();
		sqlSession.close();
		*/
		SqlSession sqlSession = sqlSessionFactory.openSession(true);	// 자동 commit상태. false나 빈칸일 경우 수동 commit
		sqlSession.insert("insertData", dto);
		sqlSession.close();
	}
	
	public void upData(DataDto dto) throws SQLException{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.update("updateData", dto);
		sqlSession.close();
	}
	
	public boolean delData(int code) {
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
