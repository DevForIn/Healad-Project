package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import exception.LoginException;
import logic.Cart;
import logic.CartService;
import logic.User;

@RestController
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	@SuppressWarnings("unused")
	@PostMapping("add")
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
		else {
			throw new LoginException("회원만 주문 가능합니다. 로그인 하세요","../user/login");
		}

		return null;
	}
	
	@RequestMapping("quantity-update")
	public String quantityUpdate(Integer itemId, Integer quantity, HttpSession session, HttpServletRequest request) {
		
		// 1. 사용자 정보 조회
		User user = (User) session.getAttribute("loginUser");
		System.out.println("user=" + user.getUserId());
		
		// 2. 유저 정보가 존재하면 카트에 아이템 추가
		if(user != null) {
			Cart cart = new Cart();
			cart.setItemId(itemId);
			cart.setQuantity(quantity);
			cart.setUserId(user.getUserId());
			
			cartService.updateCart(cart);
		}
		
		return null;
	}
	
	@DeleteMapping("deleteAll")
	public String deleteAll(HttpSession session) {
		
		// 1. 사용자 정보 조회
		User user = (User) session.getAttribute("loginUser");
		
		// 2. 유저 정보가 존재하면 카트에 아이템 추가
		if(user != null) {
			cartService.deleteAll(user.getUserId());
		}
		
		return null;
	}
	
	@RequestMapping("delete")
	public String delete(Integer itemId, HttpSession session) {
		// 1. 사용자 정보 조회
		User user = (User) session.getAttribute("loginUser");
		
		// 2. 유저 정보가 존재하면 카트에 해당 유저 아이디로 카트 아이템 삭제
		if(user != null) {
			Cart cart = new Cart();
			cart.setUserId(user.getUserId());
			cart.setItemId(itemId);
			cartService.delete(cart);
		}
		
		return null;
	}	
}
