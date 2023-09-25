import 'package:flutter/cupertino.dart';
import 'package:orderfastfood/database/db.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/cartmodel.dart';

class CartProvider extends ChangeNotifier{
  //we have the quantity of the product
  late int _counter=0;
 int get counter => _counter;
// we have the total price
late double _totalPrice= 0;
double get totalPrice =>_totalPrice;
//we have a list of products
late Future<List<Cart>> _cartItem;
  Future<List<Cart>> get cartItem =>_cartItem;
// get the data from the database as the user put it
// need to create object from database
DbHelper dB =DbHelper();
//future function to return the data in database
  Future<List<Cart>> getData()
  {
    _cartItem=dB.getCartList() as Future<List<Cart>>;
    return _cartItem;
  }
//to get the prefix product use the shared preference that store the data
// set the counter and the price of the product as store them into sharedpreference
void _setPrefItems ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('item_price', _totalPrice);
    notifyListeners();
}
//get the counter and the price from the shared preference
  void _getPrefItems ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   _counter= prefs.getInt('cart_item')??0;
   _totalPrice = prefs.getDouble('item_price')??0.0;
   notifyListeners();
  }
  void addTotalPrice(double productPrice){
    _totalPrice=_totalPrice+productPrice;
    _setPrefItems();
    notifyListeners();

  }
  void removePrice(double productPrice){
    _totalPrice=_totalPrice-productPrice;
    _setPrefItems();
    notifyListeners();
  }
  // get the total price
double getTotalPrice(){
    _getPrefItems();
    return _totalPrice;
}
//to add the counter
  void addCounter(){
    _counter++;
    _setPrefItems();
    notifyListeners();

  }
  void removeCounter(){
    _counter--;
    _setPrefItems();
    notifyListeners();

  }
  //get the counter
int getCounter(){
    _getPrefItems();
    return _counter;
}
}