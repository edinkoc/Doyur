import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app_constants.dart';
import 'package:myapp/base/no_data_page.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/dimensions.dart';
import 'package:myapp/pages/home/main_tech_page.dart';
import 'package:myapp/routes/route_helper.dart';
import 'package:myapp/widgets/app_icon.dart';
import 'package:myapp/widgets/big_text.dart';
import 'package:myapp/widgets/small_text.dart';

import '../../controllers/popular_product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.Height20*3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (Get.previousRoute == '/cart-page') {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.arrow_circle_left, IconSize: Dimensions.iconSize24, IconColor: Color(0xFF0C2F60)),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(()=>MainFoodPage());
                  },
                  child: AppIcon(icon: Icons.home, IconSize: Dimensions.iconSize24, IconColor: Color(0xFF0C2F60)),
                ),
                AppIcon(icon: Icons.shopping_cart, IconSize: Dimensions.iconSize24, IconColor: Color(0xFF0C2F60)),
              ],
            )
        ),
        GetBuilder<CartController>(
          builder: (cartController) {
            return cartController.getItems.length > 0
                ? Positioned(
              top: Dimensions.Height30 * 4,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                color: Color(0xFFC1C4C7),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (context, index) {
                      var cartItem = cartController.getItems[index];
                      return Container(
                        height: Dimensions.Height30 * 4,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: Dimensions.Height30 * 4,
                                height: Dimensions.Height30 * 4,
                                margin: EdgeInsets.only(bottom: Dimensions.Height15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      AppConstants.BASE_URL +
                                          AppConstants.UPLOAD_URL +
                                          cartItem.img!,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Color(0xFF052A57),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width20),
                            Expanded(
                              child: Container(
                                height: Dimensions.Height15 * 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    BigText(
                                      color: Color(0xFF0C2F60),
                                      text: cartItem.name!,
                                      size: Dimensions.Font16,
                                    ),
                                    SmallText(
                                      color: Color(0xFF0C2F60),
                                      text: "Sugary",
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          color: Color(0xFF0C2F60),
                                          text: cartItem.price.toString(),
                                          size: Dimensions.Font16,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Dimensions.Height5,
                                              horizontal: Dimensions.width20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(Dimensions.radius15),
                                            color: Color(0xFF123650),
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.decrementItemQuantity(cartItem.product!);
                                                  print("decrement");
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Color(0xFFC1C4C7),
                                                  size: Dimensions.Font16,
                                                ),
                                              ),
                                              SizedBox(width: Dimensions.width10 / 2),
                                              BigText(
                                                color: Color(0xFFC1C4C7),
                                                text: cartItem.quantity.toString(),
                                                size: Dimensions.Font16,
                                              ),
                                              SizedBox(width: Dimensions.width10 / 3),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(cartItem.product!, 1);
                                                  print("increment");
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Color(0xFFC1C4C7),
                                                  size: Dimensions.Font16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
                : NoDatapage();
          },
        ),

      ],
    ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
          return Container(
            height: Dimensions.buttomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.Height30, bottom: Dimensions.Height30, right: Dimensions.width20, left: Dimensions.width30),
            decoration: BoxDecoration(
                color: Color(0xFF0C2F60),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(0, 0),
                  topRight: Radius.elliptical(0, 0),
                )
            ),
            child: cartController.getItems.isNotEmpty
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.Height5,
                      horizontal: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(Dimensions.radius15),
                    color: Color(0xFFC1C4C7),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(
                        color: Color(0xFF070404),
                        text: "\$" +
                            cartController.totalAmount.toString(),
                        size: Dimensions.Font26 / 1.4,
                      ),
                      SizedBox(width: Dimensions.width10 / 3),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.Height5,
                      horizontal: Dimensions.width20),
                  child: GestureDetector(
                    onTap: () {
                      print("tapped");
                      cartController.addToHistory();
                    },
                    child: BigText(
                      color: Color(0xFF123650),
                      text: "Check Out",
                      size: Dimensions.Font26 / 1.4,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(Dimensions.radius20),
                    color: Color(0xFFC1C4C7),
                  ),
                ),
              ],
            )
                : Container(),
          );
        },)
    );
  }
}
