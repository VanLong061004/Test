<%@page import="java.net.URLEncoder"%>
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
	String schoolName=(String)  session.getAttribute("name");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String phone=request.getParameter("phone");
	String about=request.getParameter("about");
	String favourites1=request.getParameter("favourites1");
	String favourites2=request.getParameter("favourites2");
	String fav="";
	if(favourites1!=null){
		fav+=favourites1+'-';
	}
	else{
		fav+=favourites2;
	}
%>
	<h2><%=schoolName %></h2>
	<table>
		<tr>
			<td>ten</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>password</td>
			<td><%=password %></td>
		</tr>
		<tr>
			<td>phone</td>
			<td><%=phone %></td>
		</tr>
		<tr>
			<td>about</td>
			<td><%=about %></td>
		</tr>
		<tr>
			<td>so thich</td>
			<td><%=fav %></td>
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



