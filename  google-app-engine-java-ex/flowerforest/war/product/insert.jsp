<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/insertFlower" method="post">
 <div style="font-weight:bold;">FlowerForest-新增商品!</div><br/>

						<div>
							名稱：
							<input type="text" name="title" size="40">(愛的誓言)
						</div>
						<br/>
						<div>價格:
							<input type="text" name="price" size="40"/>(2000)
						</div>
						<br/>
						<div>
							尺寸:
							<input type="text" name="size" size="40">(35*35*50)
						</div>
						<br/>
						<div>
							敘述:
							<input type="text" name="desc" size="40">(愛的誓言不輕易說出口，我會把它放在心底，由衷的希望靠我的努力能讓你幸福。花材豐富，多采多姿，送禮大方。)
						</div>
						<br/>
						<div>規格:
							<input type="text" name="spec" size="40"/>(白玫 粉玫 粉桔梗 滿天星)
						</div>
						<br/>
						<div>配件:
							<input type="text" name="accessories" size="40"/>(葉材)
						</div>
						<br/>
						<div>說明:
							<input type="text" name="explain" size="40"/>(適合贈情人等特殊節日)
						</div>
						<br/>
						<div>配送:
							<input type="text" name="distribution" size="40"/>(專人配送)
						</div>
						<br/>
						<div>
							備註:
							<textarea name="memo" rows="4" cols="60">1.台北縣市以外請於收貨前1天前[下午2點前]訂購。2.部份植物，因時節不同，而有所變動，變動時，將會用相似商品取代。3.台北縣市以外以宅配送達。</textarea>
						</div>
						<br/>
						<div>
							<input type="submit" value="Insert Product" />
						</div>
					</form>
</body>
</html>