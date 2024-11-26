<%@page import="java.util.Date"%>
<%@page import="com.trungtamjava.model.User"%>
<%@page import="com.trungtamjava.service.UserService"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String idStr=request.getParameter("id");
	UserService userService=new UserService();
	User user=userService.getUserById(Integer.valueOf(idStr));
	request.setAttribute("u", user);
%>
<% //set giá trị  %>
	<c:set value="1" var="x"></c:set>
	
	<c:set value="<%= new Date() %>" var="now"></c:set>
	<%//format cài thư viện ở trên %>
	<p> <fmt:formatDate value="${now }" type="time"/> </p>
	<p> <fmt:formatDate value="${now }" type="date"/> </p>
	<p> <fmt:formatDate value="${now}" pattern="dd/MM/yyyy hh:mm"/> </p>
	<p>${x }</p>
	<%
	//<c:out nó cũng in ra màn hình nhưng nếu có chứa ký tự đặc biệt thì nóvẫn giữ nguyên in ra màn hinhf
	%>
	<p> <c:out value="${x }"></c:out> </p>
	
	<p>${fn:contains("u.name","a") ?"dung" :"sai"  }
	</p>
	<table>
		<tr>
			<td>ten</td>
			<td>${u.name}</td>
		</tr>
		<tr>
			<td>password</td>
			<td><%=user.getPassword() %></td>
		</tr>
		<tr>
			<td>phone</td>
			<td><%=user.getPhone() %></td>
		</tr>
		<tr>
			<td>about</td>
			<td><%=user.getAbout() %></td>
		</tr>
		<tr>
			<td>so thich</td>
			<td><%=user.getFavourites() %></td>
		</tr>

	</table>
	<%@ page import="java.net.URLEncoder" %>
	<%
	    String cookieValue = URLEncoder.encode("Anh Long", "UTF-8");
	    Cookie cookie = new Cookie("name", cookieValue);
	    response.addCookie(cookie);
	%>

	<%
	    //Cookie cookie = new Cookie("name", "trung tam java");
	    //response.addCookie(cookie);
		
	%>
</body>
</html>



