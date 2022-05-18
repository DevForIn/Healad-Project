package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Item;

public interface ItemMapper {
	
	@Select("select item_id, item_name, price, description, picture_url, use_yn, item_cat_id"
			+ " from item where item_cat_id = #{value}")
	List<Item> select(Integer itemCatId);

}
