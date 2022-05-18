package controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@RequestMapping("add")
	public String add(Integer itemId, Integer quantity, HttpSession session, HttpServletResponse response) {
//		Item item = service.getItem(id);
//		Cart cart = (Cart)session.getAttribute("CART");
//		if(cart == null) {
//			cart = new Cart();
//			session.setAttribute("CART", cart);
//		}
//		cart.push(new ItemSet(item, quantity));
//		mav.addObject("cart", cart);
//		mav.addObject("message", item.getName() + ":" + quantity + "개 장바구니 추가");
		return "";
	}
}