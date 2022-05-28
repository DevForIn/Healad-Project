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
	private Map<String,Object> param = new HashMap<String,Object>();
	private Class<NoticeMapper> cls = NoticeMapper.class;
	
	public int count(String noid) {
		return template.getMapper(cls).count(noid);
	}
	public List<Notice> list(Integer pageNum, int limit, String noid) {
		param.clear();
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		param.put("startrow", startrow);
		param.put("endrow", endrow);
		param.put("noid", noid);
		return template.getMapper(cls).list(param);
	}
	public void write(Notice notice) {
		int num = maxNum() +1; 
		notice.setNum(num);
		notice.setGrp(num); 
		template.getMapper(cls).write(notice);
	}
	private int maxNum() {
		return template.getMapper(cls).maxNum();
	}
	public Notice selectOne(Integer num) {
		return template.getMapper(cls).selectOne(num);
	}
	public void update(Notice notice) {
		template.getMapper(cls).update(notice);
		
	}
	public void delete(int num) {
		template.getMapper(cls).delete(num);
		
	}

}
