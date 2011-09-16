function addCart(itemNo,itemNm,spec1,spec2,price,sells,target) {
  var winName = "_parent" ;
  var features = "top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes" ;
  var url = "/shop?" ;
  url = url + "itemNo=" + encodeURIComponent(itemNo);
  url = url + "&itemNm=" + encodeURIComponent(itemNm);
  url = url + "&spec1=" + encodeURIComponent(spec1);
  url = url + "&spec2=" + encodeURIComponent(spec2);
  url = url + "&price=" + price;
  url = url + "&qty=1" ;
  url = url + "&sells="+sells ;
  if (target == "_blank" ) {
    winName = target ;
    features = features + ",width=800,height=600" ;
  }
  window.open(url,winName,features);
}

function addCartForm(formObj) {
  var spec1 = "" ;
  var spec2 = "" ;
  //if ( typeof($("#spec1").val()) == 'object') {
    //spec1 = formObj.spec1.options[formObj.spec1.selectedIndex].value ;
  //}
  //if ( typeof($("#spec2").val()) == 'object') {
    //spec2 = formObj.spec2.options[formObj.spec2.selectedIndex].value ;
  //}
  addCart($("#itemNo").val(),$("#itemNm").val(),spec1,spec2,$("#price").val(),$("#sells").val(),$("#target").val());
}