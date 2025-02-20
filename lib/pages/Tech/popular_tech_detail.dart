import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/app_constants.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/controllers/popular_product_controller.dart';
import 'package:myapp/dimensions.dart';
import 'package:myapp/pages/home/main_tech_page.dart';
import 'package:myapp/widgets/app_column.dart';

import '../../widgets/Icon_text_widget.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/exandable_text_widget.dart';
import '../../widgets/small_text.dart';
import '../cart/cart_page.dart';

class PopularTechDetail extends StatelessWidget {
  int pageId;
  PopularTechDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    //print("page is id " + pageId.toString());
    //print("product name is " + product.name.toString());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.PopularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                        AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!
                      )
                  )
                ),
          )),
          Positioned(
              top: Dimensions.Height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> MainFoodPage());
                  },
                    child: AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>CartPage());
                        },
                        child: Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart_outlined),

                            if (Get.find<PopularProductController>().totalItems >= 1)
                              Positioned(
                                right: 0,
                                top: 0,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AppIcon(icon: Icons.circle,),
                                      GetBuilder<PopularProductController>(
                                        builder: (controller) {
                                          return Text(
                                            controller.totalItems.toString(),
                                            style: TextStyle(color: Colors.white),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                              ),
                          ],
                        ),
                      );
                    },
                  )

                ],
          )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.PopularFoodImgSize,
              bottom: 0,
              child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.Height20, bottom: Dimensions.Height10,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Color(0xf5b0aaaa),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!,),
                    SizedBox(width: Dimensions.Height20,),
                    BigText(color: Color(0xFF123650), text: "Details", size: Dimensions.Font26,),
                    SizedBox(height: Dimensions.Height20,),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description!))),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.Height5, bottom: Dimensions.Height5, left: Dimensions.width20, right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: Color(0xFFC1C4C7),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: Color(0xFF123650),)),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(color: Color(0xFF070404), text: popularProduct.inCartItems.toString(), size: Dimensions.Font26/1.4,),
                    SizedBox(width: Dimensions.width10/3,),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: Color(0xFF123650),)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.Height5, bottom: Dimensions.Height5, left: Dimensions.width20, right: Dimensions.width20),
                child: GestureDetector(
                  onTap: (){
                    popularProduct.addItem(product);
                  },
                    child: BigText(color: Color(0xFF123650), text: "\$ ${product.price!} | Add to Chart", size: Dimensions.Font26/1.4,)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Color(0xFFC1C4C7),
                ),
              )
            ],
          ),
        );
      },)
    );
  }
}
