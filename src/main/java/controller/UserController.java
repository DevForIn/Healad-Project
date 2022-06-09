package controller;

import java.util.List;

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
import logic.Review;
import logic.ReviewService;
import logic.Sale;
import logic.SaleService;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;
	@Autowired
	private SaleService saleService;
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("*")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());	
		return mav;	
	}	

	@PostMapping("signUp")
	public ModelAndView notLoginChecksignUp(@Valid User user,BindingResult bresult,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			bresult.reject("error.input.user");			
			return mav;	
		}
		try {
			service.userInsert(user);
			mav.addObject("user",user);
			String message = user.getUserId()+"님의 회원가입이 완료되었습니다 !";
			mav.addObject("message",message);
			mav.addObject("url",request.getContextPath()+"/user/login");
			mav.setViewName("alert");
				
		  // KEY - ID 중복 검증
		} catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			bresult.reject("error.duplicate.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
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
				String message= dbUser.getUserId()+"님 환영합니다 :D !";
				session.setAttribute("loginUser", dbUser);	
				mav.addObject("message",message);
				mav.addObject("url",request.getContextPath()+"/");
				mav.setViewName("alert");
				if(dbUser.getUserId().equals("admin")) {
					message = "관리자 계정으로 로그인 하셨습니다.";
					mav.addObject("message",message);
					mav.addObject("url",request.getContextPath()+"/");
					mav.setViewName("alert");
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
	public ModelAndView logout(HttpSession session,HttpServletRequest request) {
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		String message= "로그아웃 되었습니다.";
		mav.addObject("message",message);
		mav.addObject("url",request.getContextPath()+"/");
		mav.setViewName("alert");
		return mav;
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
	public ModelAndView ModifyUser(@Valid User user, BindingResult bresult,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String message = "";
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

			if(user.getUserId().equals(loginUser.getUserId())) {
				session.setAttribute("loginUser", user);	
				message= "정보 수정이 완료되었습니다.";
				mav.addObject("url",request.getContextPath()+"/user/mypage?id="+loginUser.getUserId());
			}
			if(loginUser.getUserId().equals("admin")) {
				message= user.getUserId()+"님의 정보 수정이 완료되었습니다.";
				mav.addObject("url",request.getContextPath()+"/master/userList");	
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("고객 정보 수정실패","modifyUser?id="+loginUser.getUserId());
		}
		mav.addObject("message",message);
		mav.setViewName("alert");
		return mav;
	}
	@PostMapping("modifyPW")
	public ModelAndView modifyPW(User user,@Param("pwd") String pwd,@Param("newpwd1") String newpwd1,HttpServletRequest request,HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		if(!pwd.equals(loginUser.getPwd())) {
			throw new LoginException("비밀번호 오류입니다.","modifyPW?id="+user.getUserId());
		}
		ModelAndView mav = new ModelAndView();
		String message = "";
		try {
			service.modifyPwd(user.getUserId(),newpwd1);
			user.setPwd(newpwd1); // session의 loginUser 객체의 비밀번호 수정
			if(loginUser.getUserId().equals("admin")) {
				message= user.getUserId()+"님의 비밀번호 수정이 완료되었습니다.";
				mav.addObject("url",request.getContextPath()+"/master/userList");	
			} else {
				message= "비밀번호 수정이 완료되었습니다.";
				mav.addObject("url",request.getContextPath()+"/user/mypage?id="+loginUser.getUserId());
			}
		} catch(Exception e) {
			e.printStackTrace();
			if(loginUser.getUserId().equals("admin")){
				throw new LoginException("비밀번호 정보 수정 오류","../master/userList");
			} else {
				throw new LoginException("비밀번호 정보 수정 오류","modifyPW?id="+loginUser.getUserId());
			}
		}
		mav.addObject("message",message);
		mav.setViewName("alert");
		return mav;
	}
	@PostMapping("deleteUser")
	public ModelAndView idCheckdeleteUser(User user,String pwd,String userId,HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		String message = "";
		if(userId.equals("admin")) {
			throw new LoginException("관리자는 탈퇴가 불가합니다.","userList");
		}
		
		if(!pwd.equals(loginUser.getPwd())) {			
			throw new LoginException("비밀번호를 확인하세요.","deleteUser?id="+userId);
		} 				
		
		try {
			service.deleteUser(userId);
		} catch(Exception e) {
			e.printStackTrace();
			throw new LoginException("탈퇴 오류","deleteUser?id="+userId);
		}		
		
		if(loginUser.getUserId().equals("admin")){
			message= user.getUserId()+"님의 강제 탈퇴처리가 완료되었습니다.";
			mav.addObject("url",request.getContextPath()+"/master/userList");
		} else {
			message= "정상적으로 탈퇴 되었습니다.";
			mav.addObject("url",request.getContextPath()+"/");
			session.invalidate();			
		}
		mav.addObject("message",message);
		mav.setViewName("alert");
		return mav;
	}
	
	@RequestMapping("orderList")
	public ModelAndView idCheckOrderList(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.selectUser(id);
		List<Sale> salelist = saleService.saleList(id);	
		mav.addObject("user",user);
		mav.addObject("salelist",salelist);
		return mav;
	}
	@RequestMapping("review")
	public ModelAndView review(String id,HttpSession session) {		
		ModelAndView mav = new ModelAndView();
		User user = service.selectUser(id);
		List<Review> reviewList = reviewService.reviewList(id);	
		mav.addObject("user",user);
		mav.addObject("reviewList",reviewList);
		return mav;
	}
}
