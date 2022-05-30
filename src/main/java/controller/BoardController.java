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
		int count = boardService.count();	// 게시판 구분 별 전체 게시물 등록 건수
		List<Notice> Noticelist = boardService.noticelist(pageNum, limit); // 페이지에 출력한 게시물
		int maxpage = (int)((double)count/limit + 0.95); // 최대 필요한 페이지 수
		int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1; // 화면에 표시할 페이지의 시작 번호
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		
		// 화면에 보여주기 위한 게시물 번호
		int boardno = count - (pageNum -1) * limit;
		mav.addObject("pageNum",pageNum);	// 현재 페이지 값
		mav.addObject("maxpage",maxpage);	// 등록된 게시물의 건수에 따른 최대 페이지 갯수
		mav.addObject("startpage",startpage);	// 화면에 표시될 시작 페이지 번호
		mav.addObject("endpage",endpage);	//화면에 표시될 종료 페이지 번호. 한 화면에 10의 페이지 표시
		mav.addObject("count",count); 	// 게시판 종류별 등록된 게시물 건수
		mav.addObject("Noticelist",Noticelist);	// 화면에 출력할 게시물 데이터 목록.
		mav.addObject("boardno",boardno);
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
		mav.setViewName("mainBoard");		
		return mav;		
	}	
}
