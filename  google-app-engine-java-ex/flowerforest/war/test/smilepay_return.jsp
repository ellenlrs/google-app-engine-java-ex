<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
Classif付費方式:<%=request.getParameter("Classif") %><BR/>
A：刷卡<BR/>
B：ATM / 匯款<BR/>
C：超商代收<BR/>
D：刷卡(大陸金融卡)<BR/>
E：7-11 ibon<BR/>
F：FamiPort<BR/>
L：Life ET<BR/>
Od_sob	消費項目(使用自訂繳款單方式二時無資料):<%=request.getParameter("Od_sob") %><BR/>
Data_id	訂單號碼(使用自訂繳款單方式二時資料即為銷帳代碼):<%=request.getParameter("Data_id") %><BR/>
Process_date	交易日期:<%=request.getParameter("Process_date") %><BR/>
Process_time	交易時間 ( 採24小時制 ):<%=request.getParameter("Process_time") %><BR/>
Response_id	　1=授權成功   0=授權失敗  (刷卡作業才有此資料):<%=request.getParameter("Response_id") %><BR/>
Auth_code	　授權碼(刷卡作業及 7-11ibon 才有此資料) :<%=request.getParameter("Auth_code") %><BR/>
LastPan	卡號後 4 碼(刷卡作業才有此資料):<%=request.getParameter("LastPan") %><BR/>
Moneytype	幣別  TW=台幣 CN=人民幣：<%=request.getParameter("Moneytype") %><BR/>
Purchamt	交易金額:<%=request.getParameter("Purchamt") %><BR/>
Amount	成交金額( 實際成交金額，刷卡失敗時為0 ):<%=request.getParameter("Amount") %><BR/>
Errdesc	交易失敗原因 (刷卡作業才有此資料):<%=request.getParameter("Errdesc") %><BR/>
Pur_name	消費者姓名(使用自訂繳款單方式二時無資料):<%=request.getParameter("Pur_name") %><BR/>
Tel_number	消費者聯絡電話(使用自訂繳款單方式二時無資料):<%=request.getParameter("Tel_number") %><BR/>
Mobile_number	消費者行動電話(使用自訂繳款單方式二時無資料):<%=request.getParameter("Mobile_number") %><BR/>
Address	送貨地址(使用自訂繳款單方式二時無資料):<%=request.getParameter("Address") %><BR/>
Email	消費者電子信箱(使用自訂繳款單方式二時無資料):<%=request.getParameter("Email") %><BR/>
Invoice_num	消費者統一編號(使用自訂繳款單方式二時無資料):<%=request.getParameter("Invoice_num") %><BR/>
Remark	備註(使用自訂繳款單方式二時無資料):<%=request.getParameter("Remark") %><BR/>
Smseid追蹤碼:<%=request.getParameter("Smseid") %><BR/>
Mid_smilepay SmilePay 驗證碼(驗證是否由SmilePay送出的資料):<%=request.getParameter("Mid_smilepay") %><BR/>
</body>
</html>