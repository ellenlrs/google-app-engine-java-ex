<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.flowerforest.backend.entity.Work" %>
<%@ page import="com.db.PMF" %>
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
	<div class="entry">
		<s:form action="savework" method="post">
			<s:textfield name="title" label="標題" value="森林花苑"></s:textfield>
			<s:textfield name="imgurl" label="圖片位置" size="100"></s:textfield>
			<s:textfield name="imgwidth" label="寬"></s:textfield>
			<s:textfield name="imgheight" label="高"></s:textfield>
			<s:submit name="save" value="新增作品"></s:submit>
		</s:form>
<p class="clearfix">&nbsp;</p>
				</div>
			</div>
<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    //String query = "select from " + Greeting.class.getName();
    
    String query = "select from " + Work.class.getName() +" order by createDate";
    
    List<Work> works = (List<Work>) pm.newQuery(query).execute();
   
        for (Work w : works) {
%>

<div class="post">
				<div class="entry">
				<blockquote><a href="/update?id=<%= w.getId()%>" >修改此筆作品</a></blockquote>
<blockquote>ID:<%= w.getId()%><img width="150" height="150"  alt="" src="<%= w.getImgurl()%>"></blockquote>
<blockquote>標題:<%= w.getTitle() %></blockquote>
<blockquote>圖片位置:<%= w.getImgurl()%></blockquote>
<blockquote>寬:<%= w.getImgwidth() %></blockquote>
<blockquote>高:<%= w.getImgheight() %></blockquote>
<blockquote>建立時間:<%= w.getCreateDate() %></blockquote>
<blockquote><form action="/delwork?id=<%= w.getId()%>" method="post">
<input type="submit" value="刪除此筆作品" name="del"/>
</form></blockquote>
<p class="clearfix">&nbsp;</p>

					<p class="clearfix">&nbsp;</p>
				</div>
			</div>

<%
        }   
    pm.close();
%>
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
