package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import logic.Cart;
import logic.CartService;
import logic.Sale;
import logic.SaleService;
import logic.ShopService;
import logic.User;

@RestController
@RequestMapping("sale")
public class SaleController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private SaleService saleService;

	@Autowired
	private ShopService service;
	
	@RequestMapping("purchase")
	public ModelAndView purchase(String mileage, Cart cart, Sale sale, HttpSession session, String orderType) {
		ModelAndView mav = new ModelAndView("sale/purchase");
		User user = (User) session.getAttribute("loginUser");
		if("".equals(orderType)) orderType = "C";

		if("C".equals(orderType)) {
			System.out.println("user=" + user.getUserId());
			List<Cart> items = cartService.getList(user.getUserId());			
			service.pointAdd(mileage,user.getUserId());
			System.out.println("mileage=" + mileage);
			saleService.purchase(items, sale, user.getUserId());
		}
		else {
			saleService.purchase(cart, sale, user.getUserId());
			System.out.println("mileage=" + mileage);
			service.pointAdd(mileage,user.getUserId());
		}
		
		mav.addObject("orderType", orderType);
		mav.addObject("sale", sale);
		
		return mav;	
	}		
}
