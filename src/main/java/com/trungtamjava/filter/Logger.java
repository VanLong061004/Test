package com.trungtamjava.filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

//http://localhost:8080/BanHangJsp/user/viewUser.jsp
//@WebFilter(urlPatterns = {"/user/viewUser.jsp"})
//tất cả đều qua filter 
@WebFilter(urlPatterns = {"/*"})
public class Logger implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("filter");
		
		HttpServletRequest request1= (HttpServletRequest) request;
		request1.getSession().setAttribute("name", "trung tam java");
		
		
		chain.doFilter(request,response);
		
		//xử lý response
		response.setContentType("text/html	");
	}

	@Override

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
;
	}

}
