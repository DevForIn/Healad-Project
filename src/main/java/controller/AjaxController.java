package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import logic.ShopService;
import logic.User;

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
