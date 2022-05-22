package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Sale;

public interface SaleMapper {

	@Select("select seq_sale_id.nextval from dual")
	long selectSeq();

	@Insert("INSERT INTO SALE "
			+ "(SALE_ID, USER_ID, SALE_DATE, SALE_USER_NAME, SALE_POST_CODE, SALE_ADDR, SALE_ADDR_DETAIL, REMARK) "
			+ "VALUES (#{saleId}, #{userId}, sysdate, #{saleUserName}, #{salePostCode}, #{saleAddr}, #{saleAddrDetail}, #{remark})")
	void insert(Sale sale);

}
