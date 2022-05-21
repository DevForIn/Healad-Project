package aop;


import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component	
@Aspect		
public class UserLoginAspect {

	@Around("execution(* controller.User*.loginCheck*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("[Not Login]로그인이 필요합니다.","login");
		}
		return joinPoint.proceed();	
	}
	
	@Around("execution(* controller.User*.idCheck*(..)) && args(..,id,session)")
	public Object useridCheck(ProceedingJoinPoint joinPoint, String id, HttpSession session) 
		 throws Throwable {
		// joinPoint : 실행되는 메서드들의 순서 관리하는 객체
		// session : 핵심 메서드의 매개 변수 중 매개변수의 session 객체 
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("[idcheck]로그인 후 확인하세요.","login");
		}
		else if(!loginUser.getUserId().equals("admin") && !loginUser.getUserId().equals(id)) {
			throw new LoginException("[idcheck]본인 정보만 가능합니다.","mypage?id="+loginUser.getUserId());
		}
		return joinPoint.proceed();	// 다음 메서드 호출 -> UserController.idCheckmypage
	}
}
