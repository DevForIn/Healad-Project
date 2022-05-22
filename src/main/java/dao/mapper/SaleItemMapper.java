package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.SaleItem;

public interface SaleItemMapper {

	@Insert("INSERT INTO HEALAD.SALE_ITEM "
			+ "(SALE_ITEM_ID, SALE_ID, ITEM_ID, QUANTITY, PRICE) "
			+ "VALUES (SEQ_ITEM_ID.nextval, #{saleId}, #{itemId}, #{quantity}, #{price})")
	void insert(SaleItem saleItem);

}
