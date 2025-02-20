import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/data/repository/popular_product_repo.dart';
import 'package:myapp/models/products_model.dart';

import '../models/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _intCartItems = 0;
  int get inCartItems => _intCartItems + _quantity;

  Future<void> getPopularProductList() async {
    try {
      Response response = await popularProductRepo.getPopularProductList();
      if (response.statusCode == 200) {
        print("got products");
        Map<String, dynamic> responseData = response.body;
        List<dynamic> productsData = responseData['products'];
        _popularProductList = productsData
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
        print(_popularProductList);
        _isLoaded = true;
        update();
      } else {
        print("Failed to get products. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  void setQuantity(bool isIncrement) {
    int newQuantity;
    if (isIncrement) {
      newQuantity = _quantity + 1;
    } else {
      newQuantity = _quantity - 1;
      if (newQuantity < 0) {
        newQuantity = 0;
        if (_intCartItems > 0) {
          _intCartItems -= 1;
        }
      }
    }
    _quantity = checkQuantity(newQuantity);
    update();
  }



  int checkQuantity(int quantity) {
    if (_intCartItems + quantity < 0) {
      Get.snackbar("Item Count", "You can not reduce it more!!!!",
          backgroundColor: Color(0xFF0C2F60),
          colorText: Color(0xFFC1C4C7));
      if(_intCartItems > 0){
        _quantity = -_intCartItems;
        return quantity;
      }
      return 0;
    }
    else if (quantity > 20) {
      Get.snackbar("Item Count", "You can not add more!!!!",
          backgroundColor: Color(0xFF0C2F60),
          colorText: Color(0xFFC1C4C7));
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _intCartItems = 0;
    _cart = cart;
    var exist = _cart.existInCart(product);
    // print("exist or not " + exist.toString());
    if (exist) {
      _intCartItems = _cart.getQuantity(product);
    }
    // print("the quantity in the cart is " + inCartItems.toString());
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _intCartItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {
        // print("The id is " + value.id.toString() + " The quantity is " + value.quantity.toString());
      });
    } else {
      Get.snackbar("Item Count", "You should at least add an item to the cart!!!!",
          backgroundColor: Color(0xFF0C2F60),
          colorText: Color(0xFFC1C4C7));
    }
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
