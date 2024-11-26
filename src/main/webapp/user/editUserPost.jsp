<%@page import="com.trungtamjava.model.User"%>
<%@page import="com.trungtamjava.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String phone=request.getParameter("phone");
	String username=request.getParameter("username");
	String about=request.getParameter("about");
	String[] favourites=request.getParameterValues("favourites");
	String fav="";
	for (String f : favourites){
		fav+=f+", ";
	}
	
	String role=request.getParameter("role");
	
	UserService userService=new UserService();
	User user=new User();
	user.setName(name);
	user.setPassword(password);
	user.setPhone(phone);
	user.setUsername(username);
	user.setAbout(about);
	user.setFavourites(fav);
	user.setRole(role);
	user.setId(Integer.valueOf(id));
	userService.updateUser(user);
	
	response.sendRedirect("/BanHangJsp/user/listUser.jsp");
%>