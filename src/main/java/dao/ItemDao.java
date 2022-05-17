package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import logic.Item;

@Repository
public class ItemDao {
	private NamedParameterJdbcTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private RowMapper<Item> mapper = new BeanPropertyRowMapper<>(Item.class);
	
	@Autowired
	public void setDateSource(DataSource dataSource) { 
		template = new NamedParameterJdbcTemplate(dataSource);
	}
	
	public List<Item> select(Integer itemCatId) {
		param.put("itemCatId", itemCatId);
		String sql = "select item_id, item_name, price, description, picture_url, use_yn, item_cat_id"
				+ " from item where item_cat_id = :itemCatId";
		return template.query(sql, param, mapper);		
	}
	
}

