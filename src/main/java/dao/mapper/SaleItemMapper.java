package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.SaleItem;

public interface SaleItemMapper {

	@Insert("INSERT INTO HEALAD.SALE_ITEM "
			+ "(SALE_ITEM_ID, SALE_ID, ITEM_ID, QUANTITY, PRICE) "
			+ "VALUES (SEQ_ITEM_ID.nextval, #{saleId}, #{itemId}, #{quantity}, #{price})")
	void insert(SaleItem saleItem);

	@Select("select * from HEALAD.SALE_ITEM where SALE_ID=#{saleid}")
	List<SaleItem> list(Long saleId);

}
