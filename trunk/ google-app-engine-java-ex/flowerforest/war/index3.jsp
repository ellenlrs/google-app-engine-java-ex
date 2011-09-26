<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.flowerforest.backend.entity.Work" %>
<%@ page import="com.db.PMF" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
		<a href="/"><div id="logo"></div></a>
	<div id="header">
	</div>
	<div id="menu">
		<ul>
			<li class="first"><a href="index.html" accesskey="1" title="">首頁</a></li>
			<li><a href="index1.html" accesskey="2" title="">森林花苑</a></li>
			<li><a href="index2.html" accesskey="3" title="">優惠方案</a></li>
			<li><a href="index3.jsp" accesskey="4" title="">作品介紹</a></li>
		</ul>
	</div>
	<div id="page">
		<div id="content">
		
		<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Work.class.getName() +" order by createDate";
    List<Work> works = (List<Work>) pm.newQuery(query).execute();
        for (Work w : works) {
%>
			<div class="post">
				<h2 class="title"><a href="#"><%= w.getTitle() %></a></h2>
				<div class="entry">
					<p><img src="<%= w.getImgurl()%>" width="<%= w.getImgwidth() %>" height="<%= w.getImgheight() %>" alt="" class="alignleft border" />
					</p>
					<p class="clearfix">&nbsp;</p>
				</div>
			</div>
	<%
        }   
    pm.close();
	%>		
			
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

