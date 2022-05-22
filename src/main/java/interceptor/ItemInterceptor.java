package interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import logic.User;

public class ItemInterceptor extends HandlerInterceptorAdapter {

	@Override //BoardController.getBoard() 메서드 실행 전 호출되는 메서드
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User login = (User)session.getAttribute("loginUser");	  //로그인 정보
		if(login == null) {
			String msg = URLEncoder.encode("로그인이 필요합니다.", "UTF-8");
			response.sendRedirect(request.getContextPath() + "/user/login?msg="+ msg);
			return false;
		}
		return true; ////BoardController.getBoard() 메서드 실행.
	}
}