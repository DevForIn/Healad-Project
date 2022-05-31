package dao;

import java.util.HashMap;
import java.util.List;
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

	public int count() {
		return template.getMapper(cls).count();
	}

	public List<Notice> noticelist(Integer pageNum, int limit) {
		param.clear();
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).list(param);
	}

	public Notice Info(Integer num) {
		return template.getMapper(cls).Info(num);
	}

	public void cntAdd(Integer num) {
		template.getMapper(cls).cntAdd(num);		
	}

	public int selectCount(String column, String find) {
		param.clear();
		if(column.equals("x") || find.equals("x")) {
			return template.getMapper(cls).count();
		}
		param.put("column", column);
		param.put("find", find);
		return template.getMapper(cls).selectCount(param);
	}

	public List<Notice> selectlist(Integer pageNum, int limit, String column, String find) {
		param.clear();
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		if(column.equals("x") || find.equals("x")) {
			return template.getMapper(cls).list(param);
		}
		param.put("column", column);
		param.put("find", find);
		return template.getMapper(cls).selectlist(param);	
	}
}
