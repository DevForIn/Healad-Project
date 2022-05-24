package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;

import logic.Item;
import logic.User;

@Repository
public class ItemDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Class<ItemMapper> cls = ItemMapper.class; 	
	private Map<String,Object> param = new HashMap<String,Object>();
	 
	public List<Item> select(Integer itemCatId) {				
		return template.getMapper(cls).select(itemCatId);		
	}

	public Item selectOne(Integer itemId) {
		return template.getMapper(cls).selectOne(itemId);
	}

	public List<Item> itemList() {
		return template.getMapper(cls).itemList();
	}

	public List<Item> itemListCat(Integer cat_no) {
		return template.getMapper(cls).itemListCat(cat_no);
	}

	public void insertItem(Item item) {
		template.getMapper(cls).insertItem(item);		
	}

	public void YNchange(Integer itemId, String useYn) {
		param.clear();
		if(useYn.equals("Y")) param.put("useYn", "N");
		if(useYn.equals("N")) param.put("useYn", "Y");
		param.put("itemId", itemId);		
		template.getMapper(cls).YNchange(param);			
	}
}
