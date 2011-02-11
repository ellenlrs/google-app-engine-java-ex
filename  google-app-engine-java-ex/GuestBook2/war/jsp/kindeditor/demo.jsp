<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content2") != null ? request.getParameter("content2") : "";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<script type="text/javascript" charset="utf-8" src="/editor/kindeditor.js"></script>
	<script type="text/javascript">
	KE.show({

		id : 'content2',

		resizeMode : 1,

		allowPreviewEmoticons : false,

		allowUpload : false,

		items : [

		'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',

		'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',

		'insertunorderedlist', '|', 'emoticons', 'image', 'link']

	});

	</script>
</head>
<body>
	<%=htmlData%>
	<form name="example" method="post" action="demo.jsp">
		<textarea id="content2" name="content2" style="width:500px;height:200px;visibility:hidden;"></textarea>

		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>