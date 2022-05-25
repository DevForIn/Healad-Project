package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;

	@GetMapping("*")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());	
		return mav;	
	}	

	@PostMapping("signUp")
	public ModelAndView signUp(@Valid User user,BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			bresult.reject("error.input.user");			
			return mav;	
		}
		try {
			service.userInsert(user);
			mav.addObject("user",user);
			
		  // KEY - ID 중복 검증
		} catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			bresult.reject("error.duplicate.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:login");
		return mav;
	}
	
	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bresult,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			bresult.reject("error.input.login");			
			return mav;	
		}		
		try {			
			User dbUser = service.selectUser(user.getUserId());
			if(dbUser == null) {
				mav.getModel().putAll(bresult.getModel());
				bresult.reject("error.input.login");			
				return mav;	
			}
			if(user.getPwd().equals(dbUser.getPwd())) {
				session.setAttribute("loginUser", dbUser);	
				mav.setViewName("redirect:/");
				if(dbUser.getUserId().equals("admin")) {
					mav.setViewName("redirect:/master/userList");
				}
			} else { 
				bresult.reject("error.login.password");
				mav.getModel().putAll(bresult.getModel());
				return mav;
			}	
		} catch(EmptyResultDataAccessException e) {
			bresult.reject("error.login.id");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}	
		return mav;
	} 
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("mypage")
	public ModelAndView idCheckMypage(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.selectUser(id);
		mav.addObject("user",user);

		return mav;
	}
	@PostMapping("{url}search")
	public ModelAndView search(User user, BindingResult bresult, @PathVariable String url) {
		ModelAndView mav = new ModelAndView();
		String code = "error.userid.search";
		String title="아이디";
		if(user.getEmail() == null || user.getEmail().equals("")) {
			bresult.rejectValue("email","error.required");	
		}
		if(user.getPhoneNo() == null || user.getPhoneNo().equals("")) {
			bresult.rejectValue("phoneNo","error.required");
		}
		if(url.equals("pw")) {	
			title="비밀번호";
			code="error.password.search";	
			if(user.getUserId() == null || user.getUserId().equals("")) {
				bresult.rejectValue("userId","error.required");				
			}	
		}
		if(bresult.hasErrors()) {	
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		String result = null;

		result = service.userSearch(user,url);
		if(result ==null) {
			bresult.reject(code);	
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		mav.addObject("result",result);
		mav.addObject("title",title);
		mav.setViewName("user/search");				
		
		return mav;
	}
	@GetMapping({"modifyUser","modifyPW","deleteUser"})
	public ModelAndView idCheckChange(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.selectUser(id);
		mav.addObject("user",user);
		return mav;	
	}
	@PostMapping("modifyUser")
	public ModelAndView ModifyUser(@Valid User user, BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());		
			return mav;	
		}
		User loginUser = (User)session.getAttribute("loginUser");
		if(!user.getPwd().equals(loginUser.getPwd())) {
			bresult.reject("error.login.password");
			mav.getModel().putAll(bresult.getModel());
			return mav;			
		}
		try {
			service.modifyUser(user);
			if(user.getUserId().equals(loginUser.getUserId())) 
				session.setAttribute("loginUser", user);			
			mav.setViewName("redirect:/user/mypage?id="+loginUser.getUserId());	
			if(loginUser.getUserId().equals("admin")) {
				mav.setViewName("redirect:../master/userList");	
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("고객 정보 수정실패","modifyUser?id="+loginUser.getUserId());
		}
		return mav;
	}
	@PostMapping("modifyPW")
	public ModelAndView modifyPW(User user,@Param("pwd") String pwd,@Param("newpwd1") String newpwd1,HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		String userId = user.getUserId();
		if(!pwd.equals(loginUser.getPwd())) {
			throw new LoginException("비밀번호 오류입니다.","modifyPW?id="+loginUser.getUserId());
		}
		ModelAndView mav = new ModelAndView();
		try {
			service.modifyPwd(userId,newpwd1);
			loginUser.setPwd(newpwd1); // session의 loginUser 객체의 비밀번호 수정
			if(loginUser.getUserId().equals("admin")){
				mav.setViewName("redirect:../master/userList");
			} else {
				mav.setViewName("redirect:/user/mypage?id="+loginUser.getUserId());
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("비밀번호 정보 수정 오류","modifyPW?id="+loginUser.getUserId());
		}
		return mav;
	}
	@PostMapping("deleteUser")
	public ModelAndView idCheckdeleteUser(String pwd,String userId,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(userId.equals("admin")) {
			throw new LoginException("관리자는 탈퇴가 불가합니다.","userList");
		}
		
		if(!pwd.equals(loginUser.getPwd())) {			
			throw new LoginException("비밀번호를 확인하세요.","deleteUser?id="+loginUser.getUserId());
		} 				
		
		try {
			service.deleteUser(userId);
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("탈퇴 오류","deleteUser?id="+loginUser.getUserId());
		}		
		
		if(loginUser.getUserId().equals("admin")){
			mav.setViewName("redirect:../master/userList");
		} else {
			mav.setViewName("redirect:login");
			session.invalidate();
		}
		return mav;
	}
}
