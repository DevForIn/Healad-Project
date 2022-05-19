package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import logic.ShopService;
import logic.User;
/*
 * @Controller : @Componet(객체화) + 요청을 받아주는 클래스
 * 	메서드 리턴 타입 : String => 뷰의 이름 리턴.
 * 	메서드 리턴 타입 : ModelAndView => 뷰의 전달할 객체 + 뷰의 이름 리턴 
 * 
 * @RestController :  (@Componet(객체화) + 요청을 받아주는 클래스) + 클라이언튼에 값을 리턴  
 * 	메서드 리턴 타입 : String => 값 리턴     - 이전 버전 @ResponseBody 기능
 *  메서드 리턴 타입 : Object => 값 
 * 	 
 */
@RestController
@RequestMapping("ajax")
public class AjaxController {
	@Autowired
	ShopService service;
	
	@RequestMapping("idchk")
	public String idchk (String userId) {
		String chk=null;
		User user = service.selectUser(userId);
		if(user == null) chk = "false"; //등록된 회원이 없는 경우
		else chk = "true";
		return chk;
	}
}
