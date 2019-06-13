package cn.edu.swu.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.swu.filter.HttpFilter;

public class LoginFilter extends HttpFilter{
	
	private String userUrls;
	private String sessionKey;
	private String redirectUrl;
	private String uncheckedUrls;
	private String refuse;
	
	@Override
	protected void init() {
		ServletContext servletContext = getFilterConfig().getServletContext();
		
		userUrls = servletContext.getInitParameter("userUrls");
		sessionKey = servletContext.getInitParameter("userSessionKey");
		redirectUrl = servletContext.getInitParameter("rediretPage");
		uncheckedUrls = servletContext.getInitParameter("uncheckedUrls");
		refuse = servletContext.getInitParameter("refuse");
	}
	
	
	@Override
	public void doFilter(HttpServletRequest request,HttpServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		String servletPath = request.getServletPath();
		List<String> urls = Arrays.asList(uncheckedUrls.split(","));
		if(urls.contains(servletPath)) {
			filterChain.doFilter(request, response);
			return;
		}
		
		Object user = request.getSession().getAttribute(sessionKey);
		System.out.print(user);
		if(user == null) {
			response.sendRedirect("http://47.106.32.3:8080/demo");
			return;		
		}
		if(!user.equals("xyq")) {
			response.sendRedirect("http://47.106.32.3:8080/demo");
			return;
		}
		
		filterChain.doFilter(request, response);
	}

}
