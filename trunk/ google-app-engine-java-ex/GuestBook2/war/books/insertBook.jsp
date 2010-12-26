<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.books.Book"%>
<%@ page import="com.db.PMF"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Welcom to Ellen Google App Engine!</title>
		<link rel="stylesheet" type="text/css" href="/style.css"
			media="screen" />
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


					<form action="/insertBook" method="post">
						<div>
							AUTHOR:
							<input type="text" name="author" size="40">
						</div>
						<br/>
						<div>
							TITLE:
							<input type="text" name="title" size="40">
						</div>
						<br/>
						<div>
							ISBN:
							<input type="text" name="isbn" size="40">
						</div>
						<br/>
						<div>Book Image:
							<input type="text" name="bookImg" size="300"/>
						</div>
						<br/>
						<div>
							CONTENT:
							<textarea name="content" rows="4" cols="60"></textarea>
						</div>
						<br/>
						<div>
							<input type="submit" value="Post Greeting" />
						</div>
					</form>


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