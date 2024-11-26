<%@page import="com.trungtamjava.service.UserService"%>
<%@page import="java.util.List"%>
<%@page import="com.trungtamjava.model.User"%>

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
%>
<table>
	<tr>
		<th>ID</th>
		<th>ten</th>
		<th>tai khoan</th>
		<th>chon</th>
	</tr>
	<%
		for (User user : users){
	%>	
	<tr>
		<td><%= user.getId() %></td>
		<td><%= user.getName() %></td>
		<td><%= user.getUsername() %></td>
		<td>
			<a href="viewUser.jsp?id=<%=user.getId() %>">Chi tiet</a>
			<a href="editUser.jsp?id=<%=user.getId() %>">Sua</a>
			<a href="deleteUser.jsp?id=<%=user.getId() %>">Xoa</a>
		 </td>
	</tr>		
	<%
		}
	%>
</table>
	<%
		Cookie cookie = new Cookie("name", "trung_tam_java");
		response.addCookie(cookie);
	%>
</body>
</html>