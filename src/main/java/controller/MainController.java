package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import logic.BoardService;
import logic.Item;
import logic.Notice;
import logic.SaleService;

@RestController
public class MainController {

	@Autowired
	private SaleService saleService;

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("main") 	// 그외 모든 Get 방식 요청
	public ModelAndView getItem() {
		ModelAndView mav = new ModelAndView("main/main");
		
		// notice  조회
		List<Notice> notice = boardService.noticelist(1, 5);
		mav.addObject("notice", notice);
		
		// 리뷰 조회
		
		// 샐러드 순위 조회
		List<Item> items = saleService.getSaleItemsRank();
		mav.addObject("items", items);
		
		return mav;	
	}	
}
