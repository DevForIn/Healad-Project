package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Notice;

public interface NoticeMapper {
	@Select("select count(*) from notice")
	int count(String boardid);
	
	@Select("select * from"
			+"(select rownum rnum, num, userid, nosuject, nocontent, nofile fileurl, noregdate,"
			+"grp,grplevel,grpstep,pass,readcnt from"
			+"(select * from notice )) where rnum >= #{startrow} and rnum <= #{endrow}")
	List<Notice> list(Map<String, Object> param);

	
	@Insert("insert into notice"
			+" (num,noid,nosubject,nocontent,nofile,noregdate,ip)"
			+" values (#{num},#{noid},#{nosubject},#{nocontent},#{nofile},sysdate,#{ip})")
	void write(Notice notice);

	@Select("select nvl(max(num),0) from notice")
	int maxNum();
	
	@Select("select num,noid,nosubject,nocontent,nofile noregdate from notice")
	Notice selectOne(Integer num);


	@Update("update notice set noid=#{noid}, nosubject=#{nosubject}, nocontent=#{nocontent},"
				+ "nofile=#{nofileurl")
	void update(Notice notice);

	@Delete("delete from notice")
	void delete(int num);

}
