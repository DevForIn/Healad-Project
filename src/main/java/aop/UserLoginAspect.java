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
public class UserLoginAspect {
	// Pointcut : 핵심 메서드를 선택 방식 결정
	// Pointcut : "execution(* controller.User*.loginCheck*(..)) && args(..,session)"
	// 	* controller.User*.loginCheck*(..) : controller 패키지의 클래스 중 이름이 User로 시작하는 모든 클래스 
	//										 메서드 중 이름이 loginCheck로 시작하는 모든 메서드.
	//	args(..,session) : 메서드의 마지막 매개변수의 자료형이 session인 메서드	
	//	 				   .. : 갯수에 상관없음
	// Advice : aop 매서드의 실행 시점 설정 
	//  @Around => Pointcut 메서드의 호출 전 userLoginCheck를 먼저 호출
	// 	           핵심 메서드 실행 전, 후에 aop 메서드 실행
	//  @Before => 핵심 메서드 실행 전 aop 메서드 실행
	//  @AfterReturning => 핵심 메서드 정상 종료 후 aop 메서드의 실행
	//  @AfterThrowing => 핵심 메서드 비정상 종료 후, 오류 발생시 aop 메서드의 실행
	//  @After => 핵심 메서드 종류 후 aop 메서드의 실행
	@Around("execution(* controller.User*.loginCheck*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) 
		 throws Throwable {
		// joinPoint : 실행되는 메서드들의 순서 관리하는 객체
		// session : 핵심 메서드의 매개 변수 중 매개변수의 session 객체 
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("[userlogin]로그인 후 거래하세요.","login");
		}
		return joinPoint.proceed();	// 다음 메서드 호출 -> UserController.loginCheckmain
	}
}
