package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import dao.mapper.NoticeMapper;
import logic.Notice;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate template;
	private Class<NoticeMapper> cls = NoticeMapper.class; 	
	private Map<String,Object> param = new HashMap<String,Object>();
	
	public void write(Notice notice) {
		template.getMapper(cls).write(notice);
	}
}
