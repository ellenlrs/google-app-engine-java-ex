<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="#session.login != 'admin'">
  <jsp:forward page="/backend/Login.jsp" />  
  </s:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome, you have logined!</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/backend/backstyle.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
		<a href="/backend/index.jsp"><div id="logo"></div></a>
	<div id="header">後台管理系統
	</div>
	<jsp:include page="/backend/menu.jsp" />
	<div id="page">
		<div id="content">
			<div class="post">
				 歡迎, 登入成功. <br /><br />
  <b>Session Time: </b><%= new Date(session.getLastAccessedTime())%>
  <br />
				<div class="entry">
					<p class="clearfix">&nbsp;</p>
				</div>
			</div>
			<div style="clear: both;">&nbsp;</div>
		</div>
		
		<div style="clear: both;">&nbsp;</div>
	</div>
</div>
<div id="footer">
<p>Copyright© 2011 Flower Forest 森林花苑   All Rights Reserved.</p>
</div>
</body>
</html>
