package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;

@Service
public class CartService {
	
	@Autowired
	CartDao cartDao;

	public void addCart(Cart cart) {
		
		// 해당 사용자 아이디로 itemId 데이터가 존재하는지 확인.
		int originCartCount = cartDao.checkDuplicateItemCount(cart);
		
		// 아이템이 존재할 경우 수량만 업데이트, 없을 경우 신규 등록
		if(originCartCount > 0 ) {
			cartDao.updateCartItem(cart);
		}
		else {
			cartDao.addCart(cart);	
		}
		
	}

	public List<Cart> getList(String userId) {
		return cartDao.getList(userId);
	}

	public void updateCart(Cart cart) {
		cartDao.updateCartQuantity(cart);
	}

	public void deleteAll(String userId) {
		cartDao.deleteByUserId(userId);
	}
	
	
	

}
