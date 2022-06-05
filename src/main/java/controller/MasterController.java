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
import logic.Faq;
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
	public ModelAndView getUser(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());	
		return mav;	
	}

	@RequestMapping({"userList","outUserList"})
	public ModelAndView userList(@Param("pageNum")Integer pageNum, @Param("outpageNum")Integer outpageNum,Integer sort, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum=1;
		}	
		if(outpageNum == null || outpageNum.toString().equals("")) {
			outpageNum=1;
		}	
		int limit = 20;	
		int outLimit = 10;
		int count = service.count();	
		int outCount = service.outCount();
		List<User> userList = service.userList(pageNum,limit);	
		List<User> outuserList = service.outuserList(outpageNum,outLimit);	

		if(sort==null) sort=0;
		switch(sort) {
		case 0 : break;
		case 1 : userList = service.userListsort(pageNum,limit,sort);	
				break;
		case 2 : userList = service.userListsort(pageNum,limit,sort);	
				break;
		}
		
		int maxPage = (int)((double)count/limit + 0.95);
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) endPage = maxPage;
		
		int outMaxPage = (int)((double)outCount/limit + 0.95);
		int outStartPage = (int)((outpageNum/10.0 + 0.9) - 1) * 10 + 1;
		int outEndPage = outStartPage + 9;
		if(outEndPage > outMaxPage) outEndPage = outMaxPage;	
		
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxPage",maxPage);
		mav.addObject("startPage",startPage);	
		mav.addObject("endPage",endPage);	
		
		mav.addObject("outpageNum",outpageNum);
		mav.addObject("outMaxPage",outMaxPage);
		mav.addObject("outStartPage",outStartPage);	
		mav.addObject("outEndPage",outEndPage);	
		
		
		mav.addObject("sortnum", sort);
		
		mav.addObject("outCount",outCount);
		mav.addObject("count",count);
		mav.addObject("userList",userList);
		mav.addObject("outuserList",outuserList);
		
		
		return mav;
	}
	@RequestMapping("itemList")
	public ModelAndView itemList(@Param("pageNum")Integer pageNum,Integer sort,Integer ctn,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum=1;
		}		
		int limit = 20;			
		int count = itemService.count();	
		
		List<Item> itemList = itemService.itemList(pageNum,limit);
		if(ctn==null) ctn=0;
		if(sort==null) sort=1;
		switch(ctn) {
		case 0 : itemList = itemService.itemList(pageNum,limit);
					if(sort==3)itemList = itemService.itemUseList(sort);
					if(sort==4)itemList = itemService.itemUseList(sort);
				break;
		case 1 : itemList = itemService.itemListCat(ctn);
					if(sort==3) itemList = itemService.itemCatYN(ctn,sort);
					if(sort==4) itemList = itemService.itemCatYN(ctn,sort);
				break;
		case 2 : itemList = itemService.itemListCat(ctn);
					if(sort==3) itemList = itemService.itemCatYN(ctn,sort);
					if(sort==4) itemList = itemService.itemCatYN(ctn,sort);
				break;
		case 3 : itemList = itemService.itemListCat(ctn);
					if(sort==3) itemList = itemService.itemCatYN(ctn,sort);
					if(sort==4) itemList = itemService.itemCatYN(ctn,sort);
				break;
		case 4 : itemList = itemService.itemListCat(ctn);	
					if(sort==3) itemList = itemService.itemCatYN(ctn,sort);
					if(sort==4) itemList = itemService.itemCatYN(ctn,sort);
				break;
		}
		switch(sort) {
		case 1 : Collections.sort(itemList,(u1,u2) -> u1.getPrice().compareTo(u2.getPrice()));
				break;
		case 2 : Collections.sort(itemList,(u1,u2) -> u2.getPrice().compareTo(u1.getPrice()));
				break;
			
		}
		
		int maxPage = (int)((double)count/limit + 0.95);
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) endPage = maxPage;	
		
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxPage",maxPage);
		mav.addObject("startPage",startPage);	
		mav.addObject("endPage",endPage);	
		mav.addObject("count",count); 		
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
	public ModelAndView masterBoard(@Param("pageNum")Integer pageNum,@Param("faqPageNum")Integer faqPageNum,HttpSession session) {
		ModelAndView mav = new ModelAndView();	

		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum=1;
		}
		if(faqPageNum == null || faqPageNum.toString().equals("")) {
			faqPageNum=1;
		}
		
		int limit = 10;				
		int count = boardService.count();	
		int faqCount = boardService.faqCount();

		List<Notice> MasterList = boardService.noticelist(pageNum,limit);
		List<Faq> faqList = boardService.fqalist(faqPageNum,limit);
		
		int noticeNo = count - (pageNum -1) * limit;
		int maxPage = (int)((double)count/limit + 0.95);
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) endPage = maxPage;	
		
		int faqNo = faqCount - (faqPageNum -1) * limit;
		int faqMaxPage = (int)((double)faqCount/limit + 0.95);
		int faqStartPage = (int)((faqPageNum/10.0 + 0.9) - 1) * 10 + 1;
		int faqEndPage = faqStartPage + 9;
		if(faqEndPage > faqMaxPage) faqEndPage = faqMaxPage;	
		
		mav.addObject("faqPageNum",faqPageNum);
		mav.addObject("faqMaxPage",faqMaxPage);
		mav.addObject("faqStartPage",faqStartPage);	
		mav.addObject("faqEndPage",faqEndPage);	
		
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxPage",maxPage);
		mav.addObject("startPage",startPage);	
		mav.addObject("endPage",endPage);	
		
		mav.addObject("noCount",count); 
		mav.addObject("faqCount",faqCount); 
		
		mav.addObject("noticeNo",noticeNo);
		mav.addObject("faqNo",faqNo);
		
		mav.addObject("notice",MasterList);			
		mav.addObject("faqList",faqList);
		
		return mav;		
	}
	
	@GetMapping("modifyNotice")
	public ModelAndView getModifyNotice(Integer num,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(num != null) {
			Notice notice = boardService.noticeInfo(num);	
			String textArea = notice.getNoContent();
			textArea = textArea.replace("<br>", "\r\n");
			notice.setNoContent(textArea);
			mav.addObject("notice",notice);
		}
		
		return mav;
	}
	
	@PostMapping("modifyNotice")
	public ModelAndView PostModifyNotice(@Valid Notice notice,Integer num, BindingResult bresult,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		notice.setNoticeId(num);
		
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;			}
	
		try {
			String textArea = notice.getNoContent();
			textArea = textArea.replace("\r\n", "<br>");
			notice.setNoContent(textArea);
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
	@GetMapping("faqInfo")
	public  ModelAndView faqInfo(Integer id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Faq dbFaq = boardService.faqInfo(id); 
		mav.addObject("faq",dbFaq);
		return mav;
	}
	@GetMapping("noInfo")
	public  ModelAndView noInfo(Integer id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Notice dbnotice = boardService.noticeInfo(id); 
		mav.addObject("notice",dbnotice);
		return mav;
	}
	@GetMapping("writeNotice")
	public ModelAndView writeNotice(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",new Notice());
		
		return mav;	
	}
	
	@PostMapping("writeNotice")
	public ModelAndView PostWrite(@Valid Notice notice,BindingResult bresult, HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;	
		}
		String textArea = notice.getNoContent();
		textArea = textArea.replace("\r\n", "<br>");
		notice.setNoContent(textArea);
		boardService.noticeWrite(notice,request);
		mav.setViewName("redirect:masterBoard");
		return mav;		
	}
	
	@GetMapping("deleteBoard")
	public ModelAndView getDeleteBoard(Integer noticeId,Integer faqId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Notice dbNotice = boardService.noticeInfo(noticeId);
		Faq dbFaq = boardService.faqInfo(faqId);
		mav.addObject("faq",dbFaq);
		mav.addObject("notice",dbNotice);
		return mav;
	}
	@PostMapping("deleteBoard")
	public ModelAndView postDeleteBoard(Integer noticeId,Integer faqId,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String chk="";
		if(noticeId == null) noticeId=0;
		if(faqId == null) faqId=0;
		try {
			if(noticeId > 0)
				boardService.deleteNotice(noticeId);
			if(faqId > 0)
				boardService.deleteFaq(faqId);			
			
			chk = "ok";
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("chk",chk);
		return mav;
	}
	
	@GetMapping("modifyFaq")
	public ModelAndView getModifyFaq(Integer num,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(num != null) {
			Faq faq = boardService.faqInfo(num);
			String textArea = faq.getANSWER();
			textArea = textArea.replace("<br>", "\r\n");
			faq.setANSWER(textArea);
			mav.addObject("faq",faq);
		}		
		return mav;
	}
	
	@PostMapping("modifyFaq")
	public ModelAndView PostModifyFaq(Faq faq,Integer num, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		faq.setFaqId(num);
		String textArea = faq.getANSWER();
		textArea = textArea.replace("\r\n", "<br>");
		faq.setANSWER(textArea);
		boardService.updateFaq(faq);
		mav.setViewName("redirect:masterBoard");

		return mav;
	}
	
	@GetMapping("writeFaq")
	public ModelAndView getWriteFaq(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("faq",new Faq());
		
		return mav;	
	}
	
	@PostMapping("writeFaq")
	public ModelAndView postWriteFaq(Faq faq,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String textArea = faq.getANSWER();
		textArea = textArea.replace("\r\n", "<br>");
		faq.setANSWER(textArea);
		boardService.faqWrite(faq);
		
		mav.setViewName("redirect:masterBoard");
		return mav;		
	}
}
