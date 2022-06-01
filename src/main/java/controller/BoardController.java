package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import logic.BoardService;
import logic.Notice;
import logic.User;

@RestController
@RequestMapping("board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("mainBoard")
	public ModelAndView getBoard(@Param("pageNum") Integer pageNum,HttpSession session) {
		ModelAndView mav = new ModelAndView();		

		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum=1;
		}		
		int limit = 10;		
		
		int count = boardService.count();		
		List<Notice> Noticelist = boardService.noticelist(pageNum,limit);		
		int maxPage = (int)((double)count/limit + 0.95);
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) endPage = maxPage;		
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxPage",maxPage);
		mav.addObject("startPage",startPage);	
		mav.addObject("endPage",endPage);	
		mav.addObject("count",count); 	
		mav.addObject("Noticelist",Noticelist);
		return mav;	
	}
	
	@PostMapping("mainBoard")
	public ModelAndView postBoard(@Param("column") String column,@Param("find") String find,@Param("pageNum") Integer pageNum,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum=1;
		}		
		int limit = 10;	
		
		int count = boardService.selectCount(column,find);		
		List<Notice> Noticelist = boardService.selectlist(pageNum,limit,column,find);
		int maxPage = (int)((double)count/limit + 0.95);
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) endPage = maxPage;
		mav.addObject("bottomLine",3);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxPage",maxPage);
		mav.addObject("startPage",startPage);	
		mav.addObject("endPage",endPage);	
		mav.addObject("count",count); 	
		mav.addObject("Noticelist",Noticelist);
		return mav;	
	}
	@GetMapping("writeNotice")
	public ModelAndView writeNotice() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",new Notice());
		
		return mav;	
	}
	
	@PostMapping("writeNotice")
	public ModelAndView PostWrite(@Valid Notice notice,BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;	
		}
		boardService.noticeWrite(notice,request);
		mav.setViewName("redirect:mainBoard");
		return mav;		
	}
	
	@RequestMapping("noticeInfo")
	public ModelAndView noticeCall(Integer num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		if(num != null) {
			Notice notice = boardService.noticeInfo(num);
			if(!loginUser.getUserId().equals("admin"))
				boardService.cntAdd(num);	
			mav.addObject("notice",notice);
		}
		return mav;
	}
}
