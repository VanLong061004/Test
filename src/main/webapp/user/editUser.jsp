<%@page import="com.trungtamjava.model.User"%>
<%@page import="com.trungtamjava.service.UserService"%>
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
%>
<h1>Sua user</h1>
<form action="editUserPost.jsp" method="post">
	<input type="hidden" name="id" value=<%= user.getId() %>>
	<input name="name" type="text" placeholder="name" value=<%= user.getName() %>>
	<input name="password" type="password" placeholder="password" value=<%= user.getPassword() %>>
	<input name="phone" type="text" placeholder="phone" value=<%= user.getPhone() %>>
	<input name="username" type="text" placeholder="username" value=<%= user.getUsername() %> >
	<textarea rows="3" cols="24" name="about">
		<%= user.getAbout() %>
	</textarea>
	
	<%
		if(user.getRole().equals("role_admin")){ %>
			<input name="role" type="radio" value="role_admin" checked="checked"> Admin
			<input name="role" type="radio" value="role_user"> User
		<%
		}
		else{
			%>
				<input name="role" type="radio" value="role_admin" > Admin
				<input name="role" type="radio" value="role_user" checked="checked"> User
			<%
		}
	%>
	
	<%
		String favourites= user.getFavourites();
		if(favourites.contains("Xem phim")&& favourites.contains("Nghe nhac")){
			%>
				<input name="favourites" type="checkbox" value="Xem phim" checked="checked"> Xem phim
				<input name="favourites" type="checkbox" value="Nghe nhac" checked="checked"> Nghe nhac
			<%
			
		}
		else if(favourites.contains("Xem phim")){
			%>
				<input name="favourites" type="checkbox" value="Xem phim" checked="checked"> Xem phim
				<input name="favourites" type="checkbox" value="Nghe nhac" > Nghe nhac
			<%
		}
		else{
			%>
				<input name="favourites" type="checkbox" value="Xem phim" > Xem phim
				<input name="favourites" type="checkbox" value="Nghe nhac" checked="checked"> Nghe nhac
			<%
		}
	%>
	
	
	<input type="submit" value="Cập nhật">
</form>
</body>
</html>