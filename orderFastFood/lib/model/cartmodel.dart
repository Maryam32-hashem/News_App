class Cart {
  late int id;
  late String productId;
  late String productName;
  late String productUnit;
  late int productPrice;
  late String productImage;
  late int initialPrice;
  late int quantity;
  //constractor
  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productUnit,
    required this.quantity,
    required this.initialPrice,
    required this.productPrice,
    required this.productImage
});

Cart.fromMap(Map<dynamic, dynamic> res){
  productId = res['productId'];
  id = res['id'];
  productName = res['productName'];
  productImage = res['productImage'];
  quantity=res["quantity"];
  initialPrice=res["inttialPrice"];
  productPrice=res['productPrice'];
  productUnit=res["productUnit"];
}
//to post the attributes of the product into database used to map
Map <String,Object> toMap(){
  return

   { 'id':id,
   'productName':productName,
   "ProductPrice":productPrice,
   'productId':productId,
   'quantity':quantity,
   'initialPrice':initialPrice,
   'productImage':productImage,
   'productUnit':productUnit} //return the values in attributes to post it into database
  ;
}
}