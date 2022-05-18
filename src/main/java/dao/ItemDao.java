package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;

import logic.Item;

@Repository
public class ItemDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Class<ItemMapper> cls = ItemMapper.class; 	
	private Map<String,Object> param = new HashMap<String,Object>();
	 
	public List<Item> select(Integer itemCatId) {				
		return template.getMapper(cls).select(itemCatId);		
	}
}

