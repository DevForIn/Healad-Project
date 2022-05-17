package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("item")
public class ItemController {
	
	@Autowired
	private ShopService service;

	@GetMapping("*") 	// 그외 모든 Get 방식 요청
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());	
		return mav;	//	WEB-INF/view/user/userEntry.jsp 뷰로 설정
	}	

	@RequestMapping("menu")
	public String menu() {
		// item list 조회하는거 생성해야함.
		return null;	
	}
}
