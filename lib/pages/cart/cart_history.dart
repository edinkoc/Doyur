import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app_constants.dart';
import 'package:myapp/controllers/cart_controller.dart';
import '../../dimensions.dart';
import '../../models/cart_model.dart';
import '../../routes/route_helper.dart';
import 'cart_page.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder[getCartHistoryList[i].time!] = 1;
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.values.toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;

    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 100,
              margin: EdgeInsets.only(
                top: Dimensions.Height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                  child: getCartHistoryList.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image/cart4.png',
                          width:  2000,
                          height: 120,
                        ),
                        SizedBox(height: Dimensions.Height15),
                        Text(
                          'Nothing In the Chart History!',
                          style: TextStyle(
                            fontSize: Dimensions.Font16,
                          ),
                        ),
                      ],
                    ),
              )
                : ListView(
                  children: [
                      for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        height: 120,
                        margin: EdgeInsets.only(bottom: Dimensions.Height15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getCartHistoryList[listCounter].name!, // Replace with actual date
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: Dimensions.Font16,
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width20,
                              height: Dimensions.Height15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter < getCartHistoryList.length) {
                                      var cartItem = getCartHistoryList[listCounter];
                                      listCounter++;
                                      return index <= 1
                                          ? Container(
                                        margin: EdgeInsets.only(right: Dimensions.width20),
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius30 / 3),
                                          border: Border.all(
                                            color: Color(0xFF9A9A9A),
                                            width: 2,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(Dimensions.radius30 / 3),
                                          child: Image.network(
                                            AppConstants.BASE_URL +
                                                AppConstants.UPLOAD_URL +
                                                cartItem.img!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                          : Container();
                                    } else {
                                      return Container(); // Or any placeholder widget if needed
                                    }
                                  }),
                                ),
                                Container(
                                  height:80,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF000000),
                                    borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                  ),
                                  child: ListView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total Amount",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "${itemsPerOrder[i]} Items",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          var orderTime = cartOrderTimeToList();
                                          Map<int, CartModel> moreOrder = {};
                                          for (int j = 0; j < getCartHistoryList.length; j++) {
                                            if (getCartHistoryList[j].time == orderTime[i]) {
                                              moreOrder.putIfAbsent(
                                                getCartHistoryList[j].id!,
                                                    () => CartModel.fromJson(
                                                  jsonDecode(jsonEncode(getCartHistoryList[j])),
                                                ),
                                              );
                                            }
                                          }
                                          Get.find<CartController>().setItems = moreOrder;
                                          Get.find<CartController>().addToCartList();

                                          // Show a snackbar indicating that the item was added
                                          Get.snackbar(
                                            "Item Added",
                                            "The item has been added to the cart.",
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                            duration: Duration(seconds: 2),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6C6C6C),
                                            borderRadius: BorderRadius.circular(Dimensions.radius15 / 2),
                                          ),
                                          child: Text(
                                            "Add One More",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: CustomShapeBorder(),
      title: Text(
        "Cart History",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          child: Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 40;
    Path path = Path()
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top + radius)
      ..arcTo(Rect.fromCircle(center: Offset(rect.left + radius, rect.top + radius), radius: radius), -1.5, 1.5, false)
      ..lineTo(rect.right - radius, rect.top)
      ..arcTo(Rect.fromCircle(center: Offset(rect.right - radius, rect.top + radius), radius: radius), 0, 1.5, false)
      ..lineTo(rect.right, rect.bottom)
      ..close();
    return path;
  }
}

