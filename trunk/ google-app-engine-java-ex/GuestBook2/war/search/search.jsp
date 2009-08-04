<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="guestbook.Greeting"%>
<%@ page import="com.db.PMF"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="/style.css"
			media="screen" />
		<title>My Google AJAX Search API Application</title>
		<script
			src="http://www.google.com/jsapi?key=ABQIAAAAL1I66VcrtpULxR-ouqBRDhTWH7ts8H8n8IwP0btIaCYuuz-BehQStldtomBygXx9x6vxInDdeqNwGQ"
			type="text/javascript"></script>
		<script language="Javascript" type="text/javascript">    
		//<![CDATA[    
		google.load("search", "1");    
		function OnLoad() {      
		// Create a search control      
		var searchControl = new google.search.SearchControl();      
		// Add in a full set of searchers      
		var localSearch = new google.search.LocalSearch();      
		//searchControl.addSearcher(localSearch);      
		searchControl.addSearcher(new google.search.WebSearch());      
		searchControl.addSearcher(new google.search.VideoSearch());      
		searchControl.addSearcher(new google.search.BlogSearch());      
		// Set the Local Search center point      
		//localSearch.setCenterPoint("TAIWAN, TW");      
		// Tell the searcher to draw itself and tell it where to attach      
		searchControl.draw(document.getElementById("searchcontrol"));      
		// Execute an inital search      
		//searchControl.execute("Google");    
		}    
		google.setOnLoadCallback(OnLoad);    
		//]]>    
		</script>
	</head>
	<body>
		<div id="header">
			<div id="logo">
				<%@include file="/header.inc"%>
			</div>
			<!-- end #logo -->
			<div id="menu">
				<%@include file="/menu.inc"%>
			</div>
			<!-- end #menu -->
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">

					<div id="searchcontrol">
						Loading...
					</div>

				</div>

			</div>
			<!-- end #content -->
			<div id="sidebar">
				<%@include file="/sidebar.inc"%>
			</div>
			<!-- end #sidebar -->
		</div>
		<!-- end #page -->
		<div id="footer">
			<%@include file="/footer.inc"%>
		</div>
		<!-- end #footer -->
	</body>
</html>