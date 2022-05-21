package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component	// 객체화.
@Aspect		// AOP 기능 객체
public class MasterAspect {

	@Around("execution(* controller.Master*.*(..)) && args(..,session)")
	public Object adminLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) 
		 throws Throwable {		
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("[Admin]로그인이 필요합니다.","../user/login");
		} else if(!loginUser.getUserId().equals("admin")) {
			throw new LoginException("[Admin]관리자 계정이 필요합니다.","../user/main");
		}
		return joinPoint.proceed();	// 다음 메서드 호출 -> UserController.loginCheckmain
	}
}