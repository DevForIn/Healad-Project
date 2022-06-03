package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.FaqMapper;
import logic.Faq;

@Repository
public class FaqDao {

	@Autowired
	private SqlSessionTemplate template;
	private Class<FaqMapper> cls = FaqMapper.class;
	private Map<String,Object> param = new HashMap<String,Object>();

	public List<Faq> fqalist() {
		return template.getMapper(cls).faqlist();
	}

	public Faq faqInfo(Integer faqId) {
		return template.getMapper(cls).faqInfo(faqId);
	}

}
