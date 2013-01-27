package com.wy.tool;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodeFilter implements Filter {
	protected FilterConfig filterConfig = null; 
	public String characterEncoding = null; 
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding(characterEncoding); 
		response.setCharacterEncoding(characterEncoding); 
		// 传递控制到下一个过滤器 
		chain.doFilter(request, response); 
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterConfig = filterConfig; 
		characterEncoding = filterConfig.getInitParameter("characterEncoding"); 
		System.out.println(characterEncoding);
	}
}
