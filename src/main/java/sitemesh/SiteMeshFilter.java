package sitemesh;

import javax.servlet.annotation.WebFilter;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

/*
 * sitemesh 설정 : 화면에 공통부분을 설정 모듈
 * 1. sitemesh-3.0.1.jar 파일을 pom.xml에 sitemesh 관련 설정 추가
 * 2. webapp/layout 폴더 생성. 폴더에 kiclayout.jsp 복사
 */
@WebFilter("/*") // url 요청 정보에 SitemeshFilter를 적용한다.
public class SiteMeshFilter extends ConfigurableSiteMeshFilter{
	
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/*", "/layout/layout.jsp");
		builder.addExcludedPath("/master/itemYN*");
	}
}
