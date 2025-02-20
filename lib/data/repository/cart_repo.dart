import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../app_constants.dart';
import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];


  List<CartModel> getCartList() {
    List<String>? cartStrings = sharedPreferences.getStringList(AppConstants.CART_LIST);
    if (cartStrings == null) return [];

    List<CartModel> cartList = cartStrings.map((element) {
      return CartModel.fromJson(jsonDecode(element));
    }).toList();

    return cartList;
  }

  List<CartModel> getCartHistory() {
    List<String>? historyStrings = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST);
    if (historyStrings == null) return [];

    List<CartModel> historyList = historyStrings.map((element) {
      return CartModel.fromJson(jsonDecode(element));
    }).toList();

    return historyList;
  }

  void addToCartHistoryList() {
    List<String>? historyStrings = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST);
    if (historyStrings == null) {
      historyStrings = [];
    }
    historyStrings.addAll(cart);
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, historyStrings);
    removeCart(); // Clear the cart list after adding to history
    for (int i = 0; i < getCartHistory().length; i++) {
      print("The time for the order is: " + getCartHistory()[i].time.toString());
    }
    print("The length of the history is: ${getCartHistory().length}");
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    // sharedPreferences.remove(AppConstants.CART_LIST);
    // return;
    var time = DateTime.now().toString();
    cart = cartList.map((element) {
      element.time = time;
      return jsonEncode(element);
    }).toList();

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  }
}
