package pack.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	public List<DataDto> selectMemberAll(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<DataDto> list = null;
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			list = inter.selectDataAll();
			inter = null;
		} catch (Exception e) {
			System.out.println("selectMemberAll err: " + e);
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		return list;
	}
	
	public boolean insertMember(DataFormBean bean) {
		boolean b = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			if(inter.insertMemberData(bean)>0) b=true;
			sqlSession.commit();
			inter = null;
		} catch (Exception e) {
			System.out.println("insertMember err: " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		return b;
	}
	
	public DataDto selectMember(String id) {
		DataDto dto = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);
			dto = inter.selectMemberPart(id);
			inter = null;
		} catch (Exception e) {
			System.out.println("selectMember err: " + e);
		}
		return dto;
	}
	
	public boolean updateMember(DataFormBean bean) {
		boolean b = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);

			// 비밀번호 비교 후 업데이트 결정
			DataDto dto = inter.selectMemberPart(bean.getId());
			if(dto.getPasswd().equals(bean.getPasswd())) {
				if(inter.updateMemberData(bean)>0) b = true;
				sqlSession.commit();
				inter = null;
			}
		} catch (Exception e) {
			System.out.println("updateMember err: " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return b;
	}
	
	public boolean deleteMember(String id) {
		boolean b = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			SqlMapperInter inter = sqlSession.getMapper(SqlMapperInter.class);

			if(inter.deleMemberData(id)>0) b=true;
			sqlSession.commit();
			inter = null;
		} catch (Exception e) {
			System.out.println("deleteMember err: " + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return b;
	}
	
}
