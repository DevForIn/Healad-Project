package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleMapper;
import logic.Sale;

@Repository
public class SaleDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private Class<SaleMapper> cls = SaleMapper.class;

	
	public long selectSeq() {
		return template.getMapper(cls).selectSeq();
	}


	public void insert(Sale sale) {
		template.getMapper(cls).insert(sale);
	} 

}
