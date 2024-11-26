<%@page import="com.trungtamjava.model.User"%>
<%@page import="com.trungtamjava.service.UserService"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
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
	
	userService.addUser(user);
	
	//response.sendRedirect("/BanHangJsp/user/listUser.jsp"); ko dùng này nữa đổi qua dùng 	Tag Library
%>
<c:url value="/BanHangJsp/user/listUser.jsp" var="url"></c:url>
<c:redirect url="${url }"></c:redirect>
