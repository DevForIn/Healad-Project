package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Notice;

public interface NoticeMapper {

	@Insert("insert into NOTICE "
			+" (NOTICE_ID, NO_SUBJECT, NO_CONTENT, NO_READ_CNT, NO_FILE_URL, NO_REG_DATE)"
			+" values (SEQ_NOTICE_ID.nextval, #{noSubject}, #{noContent},0, #{noFileUrl}, sysdate)")
	void write(Notice notice);

	@Select("select count(*) from NOTICE")
	int count();

	@Select("select * from NOTICE where NOTICE_ID >= #{start} and NOTICE_ID <= #{end}")
	List<Notice> list(Map<String, Object> param);

}
