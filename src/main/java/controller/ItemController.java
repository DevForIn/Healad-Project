package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ItemService;

@Controller
@RequestMapping("item")
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	

	@GetMapping("*") 	// 그외 모든 Get 방식 요청
	public ModelAndView getItem() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Item());	
		return mav;	//	WEB-INF/view/user/userEntry.jsp 뷰로 설정
	}	

	@RequestMapping("menu")
	public ModelAndView menu(Integer itemCatId) {
		// item list 조회하는거 생성해야함.
		
		ModelAndView mav = new ModelAndView();
		if(itemCatId == null) itemCatId = 1;
		List<Item> list = itemService.getMenuList(itemCatId);
		
		mav.addObject("list", list);
		return mav;	
	}
}
