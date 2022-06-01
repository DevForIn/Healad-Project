package controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.BoardService;
import logic.Item;
import logic.ItemService;
import logic.Notice;
import logic.Sale;
import logic.SaleService;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("master")
public class MasterController {
	
	@Autowired
	private ShopService service;
	@Autowired
	private ItemService itemService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private SaleService saleService;
	
	
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
		for(User us : userList) {
			int total = 0;
			if(us.getWithdrawYn().equals("N")) {
			List<Sale> salelist = saleService.saleList(us.getUserId());
			for(Sale si : salelist) {
				total+=si.getTotal();				
			}
			us.setTotal(total);
			}
		}
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
	@GetMapping("newItem")
	public ModelAndView getnewItem(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Item item = new Item();
		mav.addObject("item",item);
		return mav;
	}
	
	@PostMapping("newItem")
	public ModelAndView postnewItem(Item item,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		itemService.insertItem(item,request);
		mav.setViewName("redirect:itemList");
		return mav;
	}
	@GetMapping("itemYN")
	public ModelAndView getItemYN(Integer id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Item item = itemService.selectOne(id);
		mav.addObject("item",item);
		return mav;
	}
	@PostMapping("itemYN")
	public ModelAndView postItemYN(Item item,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String chk = "";
		try{
			itemService.YNchange(item.getItemId(),item.getUseYn());
			chk = "ok";
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("chk",chk);
		return mav;
	}
	@GetMapping("masterBoard")
	public ModelAndView masterBoard(@Param("pageNum")Integer pageNum,HttpSession session) {
		ModelAndView mav = new ModelAndView();	

		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum=1;
		}		
		int limit = 10;				
		int count = boardService.count();		
		List<Notice> MasterList = boardService.noticelist(pageNum,limit);
		
		int maxPage = (int)((double)count/limit + 0.95);
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) endPage = maxPage;		
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxPage",maxPage);
		mav.addObject("startPage",startPage);	
		mav.addObject("endPage",endPage);	
		mav.addObject("noCount",count); 	
		mav.addObject("notice",MasterList);		
		
		return mav;		
	}
	
	@GetMapping("modifyNotice")
	public ModelAndView getModifyNotice(Integer num) {
		ModelAndView mav = new ModelAndView();
		if(num != null) {
			Notice notice = boardService.noticeInfo(num);	
			mav.addObject("notice",notice);
		}
		return mav;
	}
	
	@PostMapping("modifyNotice")
	public ModelAndView PostgetModifyNotice(@Valid Notice notice,Integer num, BindingResult bresult,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();		
		notice.setNoticeId(num);
		
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;			}
	
		try {
			notice.setNoFileUrl(request.getParameter("file2"));
			boardService.updateNotice(notice, request);
			mav.setViewName("redirect:masterBoard");
		}catch(Exception e) {
			e.printStackTrace();
			throw new BoardException("공지사항 수정을 실패했습니다.","modifyNotice?num="+notice.getNoticeId());
		}
		
		return mav;
	}
	@RequestMapping("masterOrder")
	public ModelAndView masterOrder(Integer sort, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Sale> saleList  = saleService.allList();
		if(sort==null) sort=1;
		switch(sort) {
		case 1 : Collections.sort(saleList,(u1,u2) -> u1.getSaleId().compareTo(u2.getSaleId()));
				break;
		case 2 : Collections.sort(saleList,(u1,u2) -> u2.getSaleId().compareTo(u1.getSaleId()));
				break;	
		}
		mav.addObject("saleList",saleList);
		return mav;
	}
}
