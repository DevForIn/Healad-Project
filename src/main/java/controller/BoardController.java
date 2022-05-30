package controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
	public ModelAndView getBoard() {
		ModelAndView mav = new ModelAndView();
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
			return mav;	// /WEB-INF/view/user/userEntry.jsp
		}
		boardService.noticeWrite(notice,request);

		return mav;		
	}	
}
