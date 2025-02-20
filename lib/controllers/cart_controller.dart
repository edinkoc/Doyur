import 'dart:ui';
import 'package:get/get.dart';
import 'package:myapp/models/products_model.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  List<CartModel> storageItems = [];

  void addItem(ProductModel product, int quantity) {
    if (quantity == 0) {
      Get.snackbar(
        "Item Count",
        "You should add at least one item to the cart!!!!",
        backgroundColor: Color(0xFF0C2F60),
        colorText: Color(0xFFC1C4C7),
      );
      return;
    }

    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (existingItem) {
        existingItem.quantity = existingItem.quantity! + quantity;
        return existingItem;
      });
    } else {
      _items[product.id!] = CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExit: true,
        time: DateTime.now().toString(),
        product: product,
      );
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  void decrementItemQuantity(ProductModel product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (existingItem) {
        if (existingItem.quantity! >= 0) {
          existingItem.quantity = existingItem.quantity! - 1;
        } else {
          _items.remove(product.id);
        }
        return existingItem;
      });
      update();
    }
  }

  bool existInCart(ProductModel product) {
    return _items.containsKey(product.id);
  }

  int getQuantity(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return _items[product.id]!.quantity!;
    }
    return 0;
  }

  int getTotalQuantity() {
    int totalQuantity = 0;
    _items.values.forEach((cartItem) {
      totalQuantity += cartItem.quantity!;
    });
    return totalQuantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.values.forEach((value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries
        .map((e) {
      return e.value;
    })
        .where((item) => item.quantity! > 0)
        .toList();
  }

  int get totalAmount{
      var total = 0;

      _items.forEach((key, value) {
        total += value.quantity!*value.price!;
      });
      return total;
  }

   List<CartModel> getCartData(){
      setCart = cartRepo.getCartList();
      return storageItems;
   }

   set setCart(List<CartModel> items){
      storageItems = items;
      // print("The length of the cart items: " + storageItems.length.toString());
      for(int i = 0; i < storageItems.length; i++)
        {
          _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
        }
   }

   void addToHistory(){
    cartRepo.addToCartHistoryList();
    clear();
   }

   void clear(){
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList(){
    return cartRepo.getCartHistory();
  }

  set setItems(Map<int, CartModel> setItems){
    _items = {};
    _items = setItems;
  }

  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();
  }

}