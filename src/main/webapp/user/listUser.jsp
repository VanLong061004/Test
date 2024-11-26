<%@page import="com.trungtamjava.service.UserService"%>
<%@page import="java.util.List"%>
<%@page import="com.trungtamjava.model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/BanHangJsp/user/addUser.jsp">Them user</a>
<br>
<h1>danh sach user</h1>
<%
	UserService userService=new UserService();
	List<User> users=userService.getAllUsers();
	request.setAttribute("users", users);
%>
<table>
	<tr>
		<th>ID</th>
		<th>ten</th>
		<th>tai khoan</th>
		<th>vai tro</th>
		<th>chon</th>
	</tr>
	<%//jstl%>
	<c:forEach items="${users }" var="user">
	<%//jstl%>
		<tr>
			<td>${user.id }</td>
			<td>${user.name }</td>
			<td>${user.username }</td>
			<c:choose>
				<c:when test="${user.role == 'ROLE_ADMIN'}">
					<td>Admin hệ thông </td>
				</c:when>
				<c:otherwise>
					<td>Người dùng hệ thông </td>
				</c:otherwise>
			</c:choose>
			<td>
				<a href="viewUser.jsp?id=${user.id }">Chi tiet</a>
				<a href="editUser.jsp?id=${user.id }">Sua</a>
				<a href="deleteUser.jsp?id=${user.id }">Xoa</a>
			 </td>
		</tr>		
	</c:forEach>
</table>
	<%
		Cookie cookie = new Cookie("name", "trung_tam_java");
		response.addCookie(cookie);
	%>
</body>
</html>