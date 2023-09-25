import 'package:flutter/cupertino.dart';

class Drink with ChangeNotifier {
 late String productName;
 late int id;
 late int price;
 late String imageUrl;
 Drink(
 {
   required this.productName,
   required this.id,
   required this.price,
   required this.imageUrl
}
     );
}