package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;

import logic.Item;
import logic.ItemScore;

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

	public List<Item> itemList(Integer pageNum, int limit) {
		param.clear();
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).itemList(param);
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



	public List<Item> itemCatYN(Integer cat_no, Integer sort) {
		param.clear();
		param.put("itemCatId", cat_no);
		if(sort==3) {			
			param.put("useYn", "Y");
		}
		if(sort==4) {
			param.put("useYn", "N");
		}
		return template.getMapper(cls).itemCatYN(param);
	}

	public int count() {
		return template.getMapper(cls).count();
	}

	public List<Item> itemListsort(Integer pageNum, int limit, Integer sort) {
		param.clear();
		String odb ="";
		if(sort==1) {
			odb = "desc";
		}
		if(sort==2) {
			odb = "asc";
		}
		param.put("odb", odb);
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).itemListsort(param);
	}
	
	public List<Item> itemUseList(Integer pageNum, int limit, Integer useNum) {
		param.clear();
		String useYn ="";
		if(useNum==1) {			
			useYn="Y";
		}
		if(useNum==2) {
			useYn="N";
		}
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("useYn", useYn);
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).itemUseList(param);
	}

	public int Ycount(Integer ctn) {
		return template.getMapper(cls).Ycount(ctn);
	}

	public int Ncount(Integer ctn) {
		return template.getMapper(cls).Ncount(ctn);
	}

	public int countYall() {
		return template.getMapper(cls).countYall();
	}
	public int countNall() {
		return template.getMapper(cls).countNall();
	}
	
	public int countCat(Integer ctn) {
		return template.getMapper(cls).countCat(ctn);
	}

	public List<Item> itemListsortCat(Integer pageNum, int limit, Integer sort, Integer ctn) {
		param.clear();
		param.put("itemCatId", ctn);
		String odb ="";
		if(sort==1) {
			odb = "desc";
		}
		if(sort==2) {
			odb = "asc";
		}
		param.put("odb", odb);
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).itemListsortCat(param);
	}

	public List<Item> itemUseListCat(Integer pageNum, int limit, Integer useNum, Integer ctn) {
		param.clear();
		param.put("itemCatId", ctn);
		String useYn ="";
		if(useNum==1) {			
			useYn="Y";
		}
		if(useNum==2) {
			useYn="N";
		}
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("useYn", useYn);
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).itemUseListCat(param);
	}

	public ItemScore getItemScore(Integer itemId) {
		return template.getMapper(cls).getItemScore(itemId);
	}


}
