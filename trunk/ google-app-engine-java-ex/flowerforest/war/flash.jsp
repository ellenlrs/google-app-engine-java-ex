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
<title>森林花苑</title>
<meta name="keywords" content="森林花苑" />
<meta name="description" content="森林花苑" />
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/js/jquery-1.6.4.js"></script>
<script type="text/javascript" src="/js/coin-slider.min.js"></script>
<link rel="stylesheet" href="/css/coin-slider-styles.css" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		 $('#coin-slider').coinslider({ width: 800, height: 450,navigation: true, delay: 5000,hoverPause: true, opacity: 0.7 ,links : false});
	});

	/*
		width: 565, // width of slider panel
		height: 290, // height of slider panel
		spw: 7, // squares per width
		sph: 5, // squares per height
		delay: 3000, // delay between images in ms
		sDelay: 30, // delay beetwen squares in ms
		opacity: 0.7, // opacity of title and navigation
		titleSpeed: 500, // speed of title appereance in ms
		effect: '', // random, swirl, rain, straight
		navigation: true, // prev next and buttons
		links : true, // show images as links
		hoverPause: true // pause on hover
		
	*/
</script>

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
			<div id='coin-slider'>
					<%
					    PersistenceManager pm = PMF.get().getPersistenceManager();
					    String query = "select from " + Work.class.getName() +" order by createDate";
					    List<Work> works = (List<Work>) pm.newQuery(query).execute();
					        for (Work w : works) {
					%>
						<a href="<%= w.getImgurl()%>" target="_blank">
							<img src="<%= w.getImgurl()%>"/>
							<span>
								<%= w.getTitle() %>
							</span>
						</a>
					<%
				        }   
				    pm.close();
					%>	
			</div>
			
			
		<div id="content">
		
			
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

