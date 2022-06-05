package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {
	
	@Select("select item_id , item_name, price, description, picture_url, use_yn, item_cat_id "
			+ " from item where item_cat_id = #{value}")
	List<Item> select(Integer itemCatId);

	@Select("select item_id , item_name, price, description, picture_url, use_yn, item_cat_id "
			+ " from item where item_id = #{value}")
	Item selectOne(Integer itemId);

	
	@Select("select * from item where item_cat_id = #{value}")
	List<Item> itemListCat(Integer cat_no);
	@Insert("insert into item (ITEM_ID, ITEM_NAME, PRICE, "
	+ " DESCRIPTION, PICTURE_URL, USE_YN, ITEM_CAT_ID)"
	+ " values (SEQ_ITEM_ID.nextval, #{itemName},#{price},#{description},#{pictureUrl},'Y',#{itemCatId})")
	void insertItem(Item item);

	@Update("update item set USE_YN=#{useYn} where ITEM_ID=#{itemId}")
	void YNchange(Map<String, Object> param);

	
	@Select("select * from item where use_yn = #{useYn} and item_cat_id=#{itemCatId} ")
	List<Item> itemCatYN(Map<String, Object> param);

	@Select("select count(*) from ITEM")
	int count();
	
	@Select("select * from ( select rownum rnum, item_id , item_name, price, description, picture_url, use_yn, item_cat_id "
			+ " from (select * from item order by item_id)) where rnum >= #{start} and rnum <= #{end}")
	List<Item> itemList(Map<String, Object> param);
	
	@Select("select * from ( select rownum rnum, item_id , item_name, price, description, picture_url, use_yn, item_cat_id "
			+ " from (select * from item order by price ${odb} )) where rnum >= #{start} and rnum <= #{end}")
	List<Item> itemListsort(Map<String, Object> param);
	
	@Select("select * from (select rownum rnum, item_id , item_name, price, description, picture_url, use_yn, item_cat_id "
			+ " from (select * from item where use_yn = #{useYn} order by price desc)) where rnum >= #{start} and rnum <= #{end}")
	List<Item> itemUseList(Map<String, Object> param);

	@Select("select count(*) from ITEM where item_cat_id = #{ctn} and use_yn='Y'")
	int Ycount(Integer ctn);

	@Select("select count(*) from ITEM where item_cat_id = #{ctn} and use_yn='N'")
	int Ncount(Integer ctn);
	
	@Select("select count(*) from ITEM where item_cat_id = #{ctn}")
	int countCat(Integer ctn);
	
	@Select("select count(*) from ITEM where use_yn = 'Y'")
	int countYall();
	
	@Select("select count(*) from ITEM where use_yn = 'N'")
	int countNall();
	
	@Select("select * from ( select rownum rnum, item_id , item_name, price, description, picture_url, use_yn, item_cat_id "
			+ " from (select * from item where item_cat_id = #{itemCatId} order by price ${odb} )) where rnum >= #{start} and rnum <= #{end}")
	List<Item> itemListsortCat(Map<String, Object> param);
	
	@Select("select * from (select rownum rnum, item_id , item_name, price, description, picture_url, use_yn, item_cat_id "
			+ " from (select * from item where use_yn = #{useYn} and item_cat_id = #{itemCatId} order by price desc)) where rnum >= #{start} and rnum <= #{end}")
	List<Item> itemUseListCat(Map<String, Object> param);



}
