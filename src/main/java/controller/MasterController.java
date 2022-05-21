package controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("master")
public class MasterController {
	@Autowired
	private ShopService service;

	@GetMapping("*")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());	
		return mav;	
	}

	@RequestMapping("userList")
	public ModelAndView userList(Integer sort, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<User> userList = service.userList();
		if(sort==null) sort=0;
		switch(sort) {
		case 0 : Collections.sort(userList,(u1,u2) -> u1.getUserId().compareTo(u2.getUserId()));
				break;
		case 1 : Collections.sort(userList,(u1,u2) -> u2.getUserId().compareTo(u1.getUserId()));
				break;
		}
		mav.addObject("userList",userList);
		return mav;
	}
}
