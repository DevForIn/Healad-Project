package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleItemMapper;
import logic.Item;
import logic.Sale;
import logic.SaleItem;

@Repository
public class SaleItemDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private Class<SaleItemMapper> cls = SaleItemMapper.class;
	
	public void insert(SaleItem saleItem) {
		template.getMapper(cls).insert(saleItem);
	}

	public List<SaleItem> list(Long saleId) {
		return template.getMapper(cls).list(saleId);
	}

	public List<Item> getSaleItemsRank() {
		return template.getMapper(cls).getSaleItemsRank();
	}

	public List<Sale> allList(Integer pageNum, int limit) {
		param.clear();
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).allList(param);
	}	

	public int count() {
		return template.getMapper(cls).count();
	}

}
