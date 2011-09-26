<%@ page language="java" contentType="text/html" import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Check validate!</title>
</head>
<body>
  <s:if test="#session.login != 'admin'">
  <jsp:forward page="/backend/Login.jsp" />  
  </s:if>
</body>
</html>
