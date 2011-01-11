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
<a href="/update?id=<%= p.getId()%>" >修改商品</a>
<a href="/shoppingcart?id=<%= p.getId()%>" >加入購物車</a>
<BR/><BR/>
<form action="/delproduct?id=<%= p.getId()%>" method="post">
<input type="submit" value="刪除商品" name="del"/>
</form>
</blockquote>
<%
        }   
    pm.close();
%>
</body>
</html>