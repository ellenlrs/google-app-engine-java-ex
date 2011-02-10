<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Send Mail</title>
		<link rel="stylesheet" type="text/css" href="/style.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		  <meta charset="utf-8"> 
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
							<form action="/mailhandler" method="post" accept-charset="utf-8">
								<table>
									<tr>
										<td><label for="summary">Send To</label></td>
										<td><input type="text" name="sendto" id="sendto" size="65"/></td>
									</tr>
								<tr>
										<td valign="description"><label for="description">Mail Body</label></td>
										<td><textarea rows="4" cols="50" name="mailbody" id="mailbody"></textarea></td>
									</tr>
								<tr>
										<td colspan="2" align="right"><input type="submit" value="Send"/></td>
									</tr>
								</table>
							</form>
							
	</div>
	<!-- end #content -->
</div>
<!-- end #page -->
<div id="footer">	
	<%@include file="/footer.inc"%>
</div>
<!-- end #footer -->
</body>
</html>