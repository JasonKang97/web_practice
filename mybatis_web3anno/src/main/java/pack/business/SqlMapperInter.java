package pack.business;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SqlMapperInter {
	@Select("select * from membertab")
	public List<DataDto> selectDataAll();
	
	@Select("select * from membertab where id=#{id}")
	public DataDto selectMemberPart(String id);
	
	@Insert("insert into membertab values(#{id},#{name},#{passwd},now())")
	public int insertMemberData(DataFormBean bean);
	
	@Update("update membertab set name=#{name} where id=#{id}")
	public int updateMemberData(DataFormBean bean);
	
	@Delete("delete from membertab where id=#{id}")
	public int deleMemberData(String id);
	
	
}
