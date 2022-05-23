package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import logic.Cart;
import logic.CartService;
import logic.Sale;
import logic.SaleService;
import logic.User;

@RestController
@RequestMapping("sale")
public class SaleController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private SaleService saleService;
	
	@RequestMapping("purchase")
	public ModelAndView purchase(Cart cart, Sale sale, HttpSession session, String orderType) {
		ModelAndView mav = new ModelAndView("sale/purchase");

		User user = (User) session.getAttribute("loginUser");
		
		if("".equals(orderType)) orderType = "C";

		if("C".equals(orderType)) {
			System.out.println("user=" + user.getUserId());
			List<Cart> items = cartService.getList(user.getUserId());
			saleService.purchase(items, sale, user.getUserId());
		}
		else {
			saleService.purchase(cart, sale, user.getUserId());
		}
		
		mav.addObject("orderType", orderType);
		mav.addObject("sale", sale);
		
		return mav;	
	}		
}
