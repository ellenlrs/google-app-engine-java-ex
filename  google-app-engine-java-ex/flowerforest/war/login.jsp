<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Please login</title>
</head>
<body>
 <s:actionerror/>
 <s:form action="home" method="post">
 <s:textfield name="username" label="UserName"></s:textfield>
 <s:textfield name="password" label="Password"></s:textfield>
 <s:submit name="login" value="login"></s:submit>
 </s:form>
</body>
</html>
