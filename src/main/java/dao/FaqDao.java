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

	public List<Faq> fqalist(Integer pageNum, int limit) {
		param.clear();
		int startrow = (pageNum - 1) * limit +1;
		int endrow = startrow + limit -1;
		param.put("startrow", startrow);
		param.put("endrow", endrow);
		return template.getMapper(cls).faqlist(param);
	}

	public Faq faqInfo(Integer faqId) {
		return template.getMapper(cls).faqInfo(faqId);
	}

	public int faqCount() {
		return template.getMapper(cls).faqCount();
	}

	public void deleteFaq(Integer faqId) {
		template.getMapper(cls).deleteFaq(faqId);
		
	}

	public void updateFaq(Faq faq) {
		template.getMapper(cls).updateFaq(faq);
		
	}

	public void faqWrite(Faq faq) {
		template.getMapper(cls).faqWrite(faq);
	}

	public List<Faq> itemFaqList() {
		return template.getMapper(cls).itemFaqList();	
	}
}
