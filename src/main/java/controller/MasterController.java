package controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ItemService;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("master")
public class MasterController {
	
	@Autowired
	private ShopService service;
	@Autowired
	private ItemService itemService;
	
	
	@GetMapping("*")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());	
		return mav;	
	}

	@RequestMapping({"userList","outUserList"})
	public ModelAndView userList(Integer sort, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<User> userList = service.userList();
		if(sort==null) sort=0;
		switch(sort) {
		case 0 : Collections.sort(userList,(u1,u2) -> u1.getUserId().compareTo(u2.getUserId()));
				break;
		case 1 : Collections.sort(userList,(u1,u2) -> u2.getUserId().compareTo(u1.getUserId()));
				break;
		case 2 : Collections.sort(userList,(u1,u2) -> u1.getUserId().compareTo(u2.getUserId()));
				break;
		case 3 : Collections.sort(userList,(u1,u2) -> u2.getUserId().compareTo(u1.getUserId()));
				break;
		}
		mav.addObject("userList",userList);
		return mav;
	}
	@RequestMapping("itemList")
	public ModelAndView itemList(Integer sort,Integer ctn,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Item> itemList = itemService.itemList();
		if(ctn==null) ctn=0;
		switch(ctn) {
		case 0 : itemList = itemService.itemList();
				break;
		case 1 : itemList = itemService.itemListCat(ctn);
				break;
		case 2 : itemList = itemService.itemListCat(ctn);
				break;
		case 3 : itemList = itemService.itemListCat(ctn);
				break;
		case 4 : itemList = itemService.itemListCat(ctn);
				break;		
		}
		if(sort==null) sort=1;
		switch(sort) {
		case 1 : Collections.sort(itemList,(u1,u2) -> u1.getItemId().compareTo(u2.getItemId()));
				break;
		case 2 : Collections.sort(itemList,(u1,u2) -> u2.getItemId().compareTo(u1.getItemId()));
				break;
		case 3 : Collections.sort(itemList,(u1,u2) -> u1.getPrice().compareTo(u2.getPrice()));
				break;
		case 4 : Collections.sort(itemList,(u1,u2) -> u2.getPrice().compareTo(u1.getPrice()));
				break;
		}
		mav.addObject("ctn",ctn);
		mav.addObject("itemList",itemList);
		return mav;
	}
}
