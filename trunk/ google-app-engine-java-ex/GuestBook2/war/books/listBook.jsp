<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.books.Book" %>
<%@ page import="com.db.PMF" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcom to Ellen Google App Engine!</title>
<link rel="stylesheet" type="text/css" href="/style.css" media="screen" />
</head>
<body>
<div id="header">
	<div id="logo">
	<%@include file="/header.inc"%>
	</div>
	<!-- end #logo -->
	<div id="menu">		
		<%@include file="/menu.inc"%>
	</div>
	<!-- end #menu -->
</div>
<!-- end #header -->
<div id="page">
	<div id="content">
		<div class="post">

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    //String query = "select from " + Greeting.class.getName();
    
    String query = "select from " + Book.class.getName() ;
    
    List<Book> book = (List<Book>) pm.newQuery(query).execute();
   
        for (Book b : book) {
%>
<hr>
<blockquote>ID:<%= b.getId()%></blockquote>
<blockquote><img src="<%=b.getBookImg()%>"></img>
<br/>BookImage:<%=b.getBookImg()%></blockquote>
<blockquote>Author:<%= b.getAuthor() %></blockquote>
<blockquote>Title:<%= b.getTitle() %></blockquote>
<blockquote>ISBN:<%= b.getIsbn() %></blockquote>
<blockquote>Content:<%= b.getContent() %></blockquote>

<blockquote>
<a href="/books/selectUpdBook.jsp?id=<%= b.getId()%>" >修改</a>
<BR/><BR/>
<form action="/delBook?id=<%= b.getId()%>" method="post">
<input type="submit" value="刪除" name="del"/>
</form>
</blockquote>
<%
        }   
    pm.close();
%>
   
   
    	
</div>
		
	</div>
	<!-- end #content -->
	<div id="sidebar">		
		<%@include file="/sidebar.inc"%>
	</div>
	<!-- end #sidebar -->
</div>
<!-- end #page -->
<div id="footer">	
	<%@include file="/footer.inc"%>
</div>
<!-- end #footer -->
</body>
</html>