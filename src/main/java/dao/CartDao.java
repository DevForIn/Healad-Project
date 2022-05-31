package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CartMapper;
import logic.Cart;

@Repository
public class CartDao {
	@Autowired
	private SqlSessionTemplate template;
	private Class<CartMapper> cls = CartMapper.class; 	
	private Map<String,Object> param = new HashMap<String,Object>();
	
	
	/**
	 * cart 등록
	 * @param cart
	 */
	public void addCart(Cart cart) {
		template.getMapper(cls).insert(cart);
	}


	/**
	 * 사용자 아이디, 아이템 아이디 기준 중복 체크
	 * @param cart
	 * @return
	 */
	public int checkDuplicateItemCount(Cart cart) {
		return template.getMapper(cls).checkDuplicateItemCount(cart);
	}


	public void updateCartItem(Cart cart) {
		template.getMapper(cls).updateCartItem(cart);
	}


	public List<Cart> getList(String userId) {
		return template.getMapper(cls).getList(userId);
	}


	public void updateCartQuantity(Cart cart) {
		template.getMapper(cls).updateCartQuantity(cart);
	}


	public void deleteByUserId(String userId) {
		template.getMapper(cls).deleteByUserId(userId);		
	}

	public void delete(Cart cart) {
		template.getMapper(cls).delete(cart);	
	}

}
