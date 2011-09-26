<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="menu">
		<ul>
			<li class="first"><a href="/backend/Success.jsp" accesskey="1" title="">首頁</a></li>
			<li><a href="/backend/works.jsp" accesskey="4" title="">作品介紹管理</a></li>
			<li><a href="<%= request.getContextPath() %>/logout"> ${session.login}登出</a></li>
		</ul>
	</div>