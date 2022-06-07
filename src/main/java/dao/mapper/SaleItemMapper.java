package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Item;
import logic.Sale;
import logic.SaleItem;

public interface SaleItemMapper {

	@Insert("INSERT INTO HEALAD.SALE_ITEM "
			+ "(SALE_ITEM_ID, SALE_ID, ITEM_ID, QUANTITY, PRICE) "
			+ "VALUES (SEQ_ITEM_ID.nextval, #{saleId}, #{itemId}, #{quantity}, #{price})")
	void insert(SaleItem saleItem);

	@Select("select * from HEALAD.SALE_ITEM where SALE_ID=#{saleid}")
	List<SaleItem> list(Long saleId);

	@Select("select a.* from ( "
			+ "SELECT i.*"
			+ "  FROM ("
			+ "	SELECT i.item_id, i.item_name, count(1) AS ORDER_COUNT"
			+ "	  FROM sale_item si, item i , sale s "
			+ "	 WHERE si.item_id = i.item_id "
			+ "	   AND si.SALE_ID = s.SALE_ID "
			+ "	   AND i.ITEM_CAT_ID = 1 "
			+ "	   AND s.sale_date > sysdate-30"
			+ "	GROUP BY i.item_id, i.item_name"
			+ " ) a, item i "
			+ "WHERE a.item_id = i.item_id "
			+ "ORDER BY ORDER_COUNT desc"
			+ " ) a where rownum < 4"
			)
	List<Item> getSaleItemsRank();

	@Select("SELECT * from (SELECT rownum rnum,si.sum,s.* "
			+ " FROM ( SELECT SALE_ID,sum(price) sum FROM SALE_ITEM "
			+ " GROUP BY SALE_ID ) si, SALE s "
			+ " WHERE si.SALE_ID = s.SALE_ID ORDER BY s.SALE_ID) "
			+ " WHERE rnum >= #{start} and rnum <= #{end}")
	List<Sale> allList(Map<String, Object> param);

	@Select("select count(*) from sale")
	int count();

}
