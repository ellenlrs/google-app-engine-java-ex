<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.db.PMF" %>
<%@ page import="com.flowerforest.product.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FlowserForest Update Product</title>
</head>
<body>
<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
        int id = Integer.parseInt(request.getParameter("id"));
        
        Key k = KeyFactory.createKey(Product.class.getSimpleName(), id);
        Product product = pm.getObjectById(Product.class, k);
   
       
%>
<form action="/updateProduct?id=<%= product.getId()%>" method="post">
 <div style="font-weight:bold;">FlowerForest-修改商品!</div><br/>


						<div>
							名稱：
							<input type="text" name="title" size="40"  value="<%=product.getTitle()%>">(愛的誓言)
						</div>
						<br/>
						<div>價格:
							<input type="text" name="price" size="40" value="<%=product.getPrice()%>">(2000)
						</div>
						<br/>
						<div>
							尺寸:
							<input type="text" name="size" size="40" value="<%=product.getSize()%>">(35*35*50)
						</div>
						<br/>
						<div>
							敘述:
							<input type="text" name="desc" size="40" value="<%=product.getDesc()%>">(愛的誓言不輕易說出口，我會把它放在心底，由衷的希望靠我的努力能讓你幸福。花材豐富，多采多姿，送禮大方。)
						</div>
						<br/>
						<div>規格:
							<input type="text" name="spec" size="40" value="<%=product.getSpec()%>">(白玫 粉玫 粉桔梗 滿天星)
						</div>
						<br/>
						<div>配件:
							<input type="text" name="accessories" size="40" value="<%=product.getAccessories()%>">(葉材)
						</div>
						<br/>
						<div>說明:
							<input type="text" name="explain" size="40" value="<%=product.getExplain()%>">(適合贈情人等特殊節日)
						</div>
						<br/>
						<div>配送:
							<input type="text" name="distribution" size="40" value="<%=product.getDistribution()%>">(專人配送)
						</div>
						<br/>
						<div>
							備註:
							<textarea name="memo" rows="4" cols="60"> <%=product.getMemo()%></textarea>
						</div>
						<br/>
						<div>
							<input type="submit" value="Update Product" />
						</div>
					</form>
</body>
</html>