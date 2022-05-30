package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.Notice;

public interface NoticeMapper {

	@Insert("insert into NOTICE"
			+" (NOTICE_ID,NO_SUBJECT,NO_CONTENT,NO_READ_CNT,NO_FILE_URL,NO_REG_DATE)"
			+" values (SEQ_NOTICE_ID.nextval,#{noSubject},#{noContent},#{noFileUrl},sysdate)")
	void write(Notice notice);

}
