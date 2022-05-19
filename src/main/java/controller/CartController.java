package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import logic.Cart;
import logic.CartService;
import logic.User;

@RestController
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping("add")
	public String add(Integer itemId, Integer quantity, HttpSession session, HttpServletRequest request) {
		
		// 1. 사용자 정보 조회
		User user = (User) session.getAttribute("loginUser");
		System.out.println("user=" + user.getUserId());
		
		// 2. 유저 정보가 존재하면 카트에 아이템 추가
		if(user != null) {
			Cart cart = new Cart();
			cart.setItemId(itemId);
			cart.setQuantity(quantity);
			cart.setUserId(user.getUserId());
		
			cartService.addCart(cart);
			
			
		}
		

		return null;
	}
}
