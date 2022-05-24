package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {
	
	@Select("select item_id , item_name, price, description, picture_url, use_yn, item_cat_id"
			+ " from item where item_cat_id = #{value}")
	List<Item> select(Integer itemCatId);

	@Select("select item_id , item_name, price, description, picture_url, use_yn, item_cat_id"
			+ " from item where item_id = #{value}")
	Item selectOne(Integer itemId);

	@Select("select * from item")
	List<Item> itemList();
	
	@Select("select * from item where item_cat_id = #{value}")
	List<Item> itemListCat(Integer cat_no);
	@Insert("insert into item (ITEM_ID, ITEM_NAME, PRICE, "
	+ " DESCRIPTION, PICTURE_URL, USE_YN, ITEM_CAT_ID)"
	+ " values (SEQ_ITEM_ID.nextval, #{itemName},#{price},#{description},#{pictureUrl},'Y',#{itemCatId})")
	void insertItem(Item item);

	@Update("update item set USE_YN=#{useYn} where ITEM_ID=#{itemId}")
	void YNchange(Map<String, Object> param);

}
