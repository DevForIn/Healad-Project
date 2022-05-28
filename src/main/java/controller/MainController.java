package controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {

	@RequestMapping("main") 	// 그외 모든 Get 방식 요청
	public ModelAndView getItem() {
		ModelAndView mav = new ModelAndView("main/notice");
		return mav;	
	}	
}
