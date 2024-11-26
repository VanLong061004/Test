<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Them user</h1>
<%
	//đổi lại dùng Expression Language
%> 
<h2>${cookie.name.value }</h2>
<form action="addUserPost.jsp" method="post">
	<input name="name" type="text" placeholder="name">
	<input name="password" type="password" placeholder="password">
	<input name="phone" type="text" placeholder="phone">
	<input name="username" type="text" placeholder="username">
	<textarea rows="3" cols="24" name="about"></textarea>
	
	<input name="role" type="radio" value="role_admin"> Admin
	<input name="role" type="radio" value="role_user"> User
	
	<input name="favourites" type="checkbox" value="Xem phim"> Xem phim
	<input name="favourites" type="checkbox" value="Nghe nhac"> Nghe nhac
	<input type="submit" value="Them">
</form>
</body>
</html>