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
public class CartAspect {
	@Around("execution(* controller.Cart*.*(..)) && args(..,session)")
	public Object cartCheck(ProceedingJoinPoint joinPoint, HttpSession session)
		throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");

		if(loginUser == null) {
			throw new LoginException("회원만 주문 가능합니다. 로그인 하세요","../user/login");
		}
		return joinPoint.proceed();
	}
}