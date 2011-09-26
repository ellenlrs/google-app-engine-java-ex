<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/backend/backstyle.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
		<a href="/backend/index.jsp"><div id="logo"></div></a>
	<div id="header">後台管理系統
	</div>
	<div id="menu">
	<br/>
	<ul>
			<li class="first">請輸入帳號／密碼！！</li>
		</ul>
	</div>
	<div id="page">
		<div id="content">
			<div class="post">
				<s:form action="/login" method="post">
  <s:textfield name="userId" label="Login Id"/><br>
  <s:password name="password" label="Password"/><br>
 <s:submit value="Login" align="center"/>
  </s:form>
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
