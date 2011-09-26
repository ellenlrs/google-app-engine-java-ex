<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.db.PMF" %>
<%@ page import="com.flowerforest.backend.entity.Work" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="#session.login != 'admin'">
  <jsp:forward page="/backend/Login.jsp" />  
  </s:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="/backend/backstyle.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper"><a href="/">
<a href="/backend/index.jsp"><div id="logo"></div></a>
<div id="header">後台管理系統</div>
<jsp:include page="/backend/menu.jsp" />
<div id="page">
<div id="content">
<div style="color:red;"><s:actionerror /></div>
<div class="post"> 
<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
        int id = Integer.parseInt(request.getParameter("id"));
        Key k = KeyFactory.createKey(Work.class.getSimpleName(), id);
        Work w = pm.getObjectById(Work.class, k);
%>

<form action="/updateWork?id=<%= w.getId()%>" method="post">
<div>
				標題：
				<input type="text" name="title" size="40"  value="<%=w.getTitle()%>">
</div><br/>
<div>
				圖片位置：
				<input type="text" name="imgurl" size="100"  value="<%= w.getImgurl()%>">
</div>	<br/>
<div>
				寬：
				<input type="text" name="imgwidth" size="40"  value="<%=w.getImgwidth()%>">
</div><br/>	
<div>
				高：
				<input type="text" name="imgheight" size="40"  value="<%=w.getImgheight()%>">
</div>	<br/>
		</div>
		<div>
			<input type="submit" value="儲存" />
		</div>
	</form>

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
<p>Copyright© 2011 Flower Forest 森林花苑 All Rights Reserved.</p>
</div>
</body>
</html>
