package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Cart;

public interface CartMapper {

	@Insert("INSERT INTO CART "
			+ "(CART_ID, USER_ID, ITEM_ID, QUANTITY, REG_DATE) "
			+ "VALUES (SEQ_CART_ID.nextval, #{userId}, #{itemId}, #{quantity}, sysdate)")
	void insert(Cart cart);

	@Select("select count(*) from CART WHERE ITEM_ID = #{itemId} and USER_ID = #{userId}")
	int checkDuplicateItemCount(Cart cart);

	@Update("update cart set quantity = quantity + 1 where item_id = #{itemId} and user_id = #{userId}")
	void updateCartItem(Cart cart);

	@Select("SELECT C.CART_ID, C.USER_ID, C.ITEM_ID, I.ITEM_NAME, I.PRICE, C.QUANTITY, C.REG_DATE "
			+ "FROM CART C, ITEM I "
			+ "WHERE C.ITEM_ID = I.ITEM_ID "
			+ "AND C.USER_ID = #{userId}")
	List<Cart> getList(String userId);

	@Update("update cart set quantity = #{quantity} where item_id = #{itemId} and user_id = #{userId}")
	void updateCartQuantity(Cart cart);

	@Delete("delete from cart where user_id = #{userId}")
	void deleteByUserId(String userId);
}
