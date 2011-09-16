<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="/taglibs.jsp"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="http://www.icart.tw/Sells/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="iCart,購物車,部落格,blog,相片,網站,簡單,個人網站,3c,手工香皂,美容,美髮,香水,旅遊,日本,機票,火車,自由行,高鐵,影片,投資,理財">
<META NAME="Description" CONTENT="iCart,購物車,部落格,blog,相片,網站,簡單,個人網站,3c,手工香皂,美容,美髮,香水,旅遊,日本,機票,火車,自由行,高鐵,影片,投資,理財">
<META NAME="Revisit-after" content="1">
<title> 專屬購物車</title>
<script type="text/javascript" charset="UTF-8" src="/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
	$().ready(function() {	
		 //alert("itemNO:"+$("#itemNo").val());
		 
	 });
	function gotoPage(func){
		//alert(func);
		$("#func").val(func);
	    //document.shopcar.func.value= func ;
	  	//document.shop.submit();
			location.href='/shop?func=REMOVEALL';
	}
	</script>
</head>
<body><center><form name="shop" action="shop" method="Post">
<table width="800" border="0" align="center" cellspacing="1" class="tb1">
  <tr>
    <td height="28" align=center class="tb2">購物車</td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#FFFFFF"><table border=0 width=100% cellspacing="1" class="tb1" cellpadding="2">
        <tr class="tb2">
          <td width=62 height="28" align="center">編號</td>
          <td width="415" align="center" >品名(規格)</td>
          <td align="center" width=122 >數量</td>
          <td align="center" width=55 >單價</td>
          <td align="center" width=55 >小計</td>
          <td align="center" width=56 >刪除</td>
        </tr>
		 <c:set var="total" scope="request" value="${0}"/>
		 <c:set var="totQty" scope="request" value="${0}"/>
		 <c:forEach items="${car}" var="item" varStatus="s">
        <tr>
          <td width=62 height="28" align="center" bgcolor="#FFFFFF">${item.itemNo}</td>
          <td width="415" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;${item.itemNm} ( ${item.spec1} ${item.spec2})</td>
          <td align="center" width=122 bgcolor="#FFFFFF">
		   <input type="hidden" name="itemNo" value="${item.itemNo}">
		   <input type="hidden" name="itemNm" value="${item.itemNm}">
		   <input type="hidden" name="spec1" value="${item.spec1}">
		   <input type="hidden" name="spec2" value="${item.spec2}">
		   <input type="hidden" name="price" value="${item.price}">
		   <input type="hidden" name="seqno" value="${item.seqno}">
		   <input type="text" name="qty" size="3" value="${item.qty}">
		   <input type="text" name="func" id="func" size="3" value="">
		   
		  </td>
          <td align="center" width=55 bgcolor="#FFFFFF">${item.price}</td>
          <td align="center" width=55 bgcolor="#FFFFFF"></td>
          <td align="center" width=56 bgcolor="#FFFFFF"></td>
        </tr>
		</c:forEach>
		<tr><td colspan=4><br/>
		<a href="https://ssl.smse.com.tw/ezpos_test/mtmk_utf.asp?Rvg2c=1&Dcvc=107&Od_sob=123456&Amount=999&Pur_name=圓桌椅&Tel_number=0212345678&Mobile_number=0987654321&Address=台北市天堂區天堂路1號5樓&Email=service@gmail.com&Invoice_name=Ellen科技股份有限公司&Invoice_num=80129529&Remark=備註&Roturl=http://flowerforestweb.appspot.com/test/smilepay_return.jsp&Pay_gdry=TW&Pay_zg=1&Data_id=987654321">
		訂購完成﹣刷卡結帳
		</a>
		<INPUT name="b1" type=button onClick="gotoPage('REMOVEALL')" value="清空購物車" class="button">
		<a href="/" >回首頁</a>
		</td></tr>
		<!-- 
        <tr>
          <td height="28" colspan=6 class="tb2">您選購了  個商品 </td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff>最低結帳金額︰元<span class="style1"> <br>
            （結帳時沒有超過此金額，將無法結帳，不包含運費金額）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff>商品金額為︰${total}元</td>
        </tr>
</table></td>
		</tr>
		<tr>
          <td height="28" colspan=6 align="center" bgcolor=#ffffff>
            <input name="b121" type=button onClick="gotoPage('order')" value="直接結帳" class="button">
            <c:if test="${requestScope.sess == 'haveSess'}">
            <input name="b122" value="我是 ${sessionScope.icMemNm}；直接登入" type="button" onclick="gotoPageSess('ordermembersess')" class="button">
            </c:if>
            
            <input name="b1212" type=button onClick="gotoPage('ordermember')" value="登入會員後結帳" class="button">
            <input name="b122" onClick="history.go(-1)" value="繼續購物" type="button" class="button">
            <input name="b123" onClick="goHome();" value="返回首頁" type="button" class="button">
            <INPUT name="b1" type=button onClick="gotoPage('REMOVEALL')" value="清空購物車" class="button">
<input type="hidden" name="member" value="0"></td>
        </tr>
         -->
      </table>
</form>
</center>
</body>
</html>
