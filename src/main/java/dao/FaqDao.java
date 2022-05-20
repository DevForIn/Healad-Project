package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.Faq;

/*
@Repository
public class FaqDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private Class<FaqdMapper> cls = FaqMapper.class;
	
	public int count(String fqid) {
		return template.getMapper(cls).count(fqid);
	}
	public List<Faq> list(Integer pageNum, int limit, String fqid) {
		param.clear();
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		param.put("startrow", startrow);
		param.put("endrow", endrow);
		param.put("fqid", fqid);
		return template.getMapper(cls).list(param);
	}
	public Board selectOne(Integer num) {
		return template.getMapper(cls).selectOne(num);
	}

}
*/