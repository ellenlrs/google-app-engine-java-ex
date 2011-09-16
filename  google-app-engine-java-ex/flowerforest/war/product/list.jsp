<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.flowerforest.product.Product" %>
<%@ page import="com.db.PMF" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" charset="UTF-8" src="/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
	$().ready(function() {	
		 //alert("itemNO:"+$("#itemNo").val());
	 });
	</script>
</head>
<body>
<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    //String query = "select from " + Greeting.class.getName();
    
    String query = "select from " + Product.class.getName() ;
    
    List<Product> product = (List<Product>) pm.newQuery(query).execute();
   
        for (Product p : product) {
%>
<hr>
<blockquote>ID:<%= p.getId()%></blockquote>
<blockquote>名稱:<%= p.getTitle() %></blockquote>
<blockquote>價格:<%= p.getPrice() %></blockquote>
<blockquote>尺寸:<%= p.getSize() %></blockquote>
<blockquote>敘述:<%= p.getDesc() %></blockquote>
<blockquote>規格:<%= p.getSpec() %></blockquote>
<blockquote>配件:<%= p.getAccessories() %></blockquote>
<blockquote>說明:<%= p.getExplain() %></blockquote>
<blockquote>配送:<%= p.getDistribution() %></blockquote>
<blockquote>備註:<%= p.getMemo() %></blockquote>

<blockquote>
<a href="/insert" >新增商品</a>
<a href="/update?id=<%= p.getId()%>" >修改商品</a>


<script src='/js/cart.js'></script>
<table width=300>
<tr>
<form method=post name='shop_cart' action='/shop' >
<input type=hidden name="itemNo" id="itemNo" value="<%= p.getId()%>">
<input type=hidden name=itemNm id="itemNm" value="<%= p.getTitle() %>">
<input type=hidden name=price id="price" value="<%= p.getPrice() %>">
<input type=hidden name=qty id="qty" value="1">
<input type=hidden name=sells id="sells" value="S0000000010">
<input type=hidden name='target' value="_same">
<a href='#' onClick='addCartForm(document.shop_cart);'>加入購物車</a>
<br /></form>

</td></tr></table>

<BR/><BR/>
<form action="/delproduct?id=<%= p.getId()%>" method="post">
<input type="submit" value="刪除商品" name="del"/>
</form>
<BR/><BR/>
<a href="/" >回首頁</a>

</blockquote>
<%
        }   
    pm.close();
%>
</body>
</html>