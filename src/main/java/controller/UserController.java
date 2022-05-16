package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;
	//@GetMapping : Get 방식 요청인 경우
	//@PostMapping : Post 방식 요청인 경우
	//@RequestMapping : Get/Post 방식 상관없이 요청인 경우
	
	//http://localhost:8088/springmvc1/user/userEntry
	//git test
	@GetMapping("*") 	// 그외 모든 Get 방식 요청
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());	
		return mav;	//	WEB-INF/view/user/userEntry.jsp 뷰로 설정
	}	

	@RequestMapping("mainInfo")
	public String mainInfo(HttpSession session) {
		return null;	// url과 같은 이름의 view 리턴 : user/main.jsp
	}
}
