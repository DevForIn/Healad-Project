package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import logic.Cart;
import logic.CartService;
import logic.Item;
import logic.ItemService;
import logic.User;

@RestController
@RequestMapping("item")
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private CartService cartService;

	@GetMapping("*") 	// 그외 모든 Get 방식 요청
	public ModelAndView getItem() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Item());	
		return mav;	//	WEB-INF/view/user/userEntry.jsp 뷰로 설정
	}	
 
	@RequestMapping("menu")
	public ModelAndView menu(Integer itemCatId) {
		ModelAndView mav = new ModelAndView();
		return mav;	
	}
	
	 
	@RequestMapping("cart")
	public ModelAndView cart(Integer itemCatId, HttpSession session) {
		ModelAndView mav = new ModelAndView("item/cart");
		User user = (User) session.getAttribute("loginUser");
		System.out.println("user=" + user.getUserId());
		List<Cart> items = cartService.getList(user.getUserId());
		mav.addObject("items", items);
		
		return mav;	
	}	
	
	@GetMapping("list")
	public List<Item> list(Integer itemCatId) {
		// 카테고리 조회조건이 안넘어왔을때 기본 카테고리 1 (샐러드)로 지정
		if(itemCatId == null) itemCatId = 1;
		List<Item> list = itemService.getMenuList(itemCatId);
		return list;	
	}

	 
	@RequestMapping("detail")
	public ModelAndView detail(Integer itemId) {
		ModelAndView mav = new ModelAndView();
		// 아이템 아이디 기준 상세내용 조회
		Item item = itemService.selectOne(itemId);
		mav.addObject("item", item);
		return mav;	
	}	
	
	
	@RequestMapping("order")
	public ModelAndView order(Integer itemId, HttpSession session, String orderType) {
		ModelAndView mav = new ModelAndView("item/order");
		
		int total = 0;
		double mileage = 0;
		
		if("".equals(orderType)) orderType = "C";

		User user = (User) session.getAttribute("loginUser");
		
		if("C".equals(orderType)) {
			List<Cart> items = cartService.getList(user.getUserId());
			mav.addObject("items", items);
			
			if(items != null) {
				total = items.stream()
						.mapToInt(Cart::getQuantityPrice)
						.sum();
				mileage = total * 0.05;
			}
			
		}
		else {
			Item item = itemService.selectOne(itemId);
			mav.addObject("item", item);
			total = item.getPrice();
			mileage = total * 0.05;
		}
		
		mav.addObject("orderType", orderType);
		mav.addObject("user", user);
		mav.addObject("total", total);
		mav.addObject("mileage", mileage);
		
		
		return mav;	
	}
	

}
