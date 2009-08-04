<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="guestbook.Greeting"%>
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

				新增已完成!!


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