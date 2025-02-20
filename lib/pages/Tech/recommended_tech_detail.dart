import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/app_constants.dart';
import 'package:myapp/controllers/popular_product_controller.dart';
import 'package:myapp/controllers/recommended_product_controller.dart';
import 'package:myapp/dimensions.dart';
import 'package:myapp/routes/route_helper.dart';
import 'package:myapp/widgets/app_icon.dart';
import 'package:myapp/widgets/big_text.dart';
import 'package:myapp/widgets/exandable_text_widget.dart';

import '../../controllers/cart_controller.dart';
import '../../widgets/app_column.dart';
import '../cart/cart_page.dart';

class RecommendedTechDetail extends StatelessWidget {
  final int pageId;
  const RecommendedTechDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Color(0xFF0C2F60),
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear_sharp),
                ),
                // AppIcon(icon: Icons.shopping_cart_outlined),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => CartPage());
                      },
                      child: Stack(
                        children: [
                          // Your popular products widget goes here
                          // Replace this with your actual widget that displays popular products
                          // For example, you can use ListView.builder to show a list of popular products.

                          // Shopping cart icon
                          AppIcon(icon: Icons.shopping_cart_outlined),

                          // AppIcon with a circle background if totalItems is greater than or equal to 1
                          if (Get.find<PopularProductController>().totalItems >= 1)
                            Positioned(
                              right: 0,
                              top: 0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AppIcon(icon: Icons.circle,), // Changed 'Size' to 'size'
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
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                ),
              ),
              child: Center(
                child: BigText(
                  color: Color(0xFF070404),
                  text: product.name!,
                  size: Dimensions.Font16,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(text: product.description ?? "No description available",),
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: Dimensions.width20*2.5, right:Dimensions.width20*2.5, top:Dimensions.Height20, bottom: Dimensions.Height20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.setQuantity(false);
                      },
                      child:AppIcon(icon: Icons.remove, IconSize: Dimensions.iconSize24,),
                    ),
                    BigText(color: Color(0xFF0C2F60), text: "\$ ${product.price!} + x  ${controller.inCartItems} ", size: Dimensions.Font16,),
                    GestureDetector(
                      onTap: (){
                        controller.setQuantity(true);
                      },
                      child:AppIcon(icon: Icons.add_circle_outlined, IconSize: Dimensions.iconSize24,),
                    )
                  ],
                ),
              ),
              Container(
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
                        child: InkWell(
                          child: Icon(
                            Icons.favorite_sharp,
                            color: Color(0xFF322646),
                          ),
                        )
                    ),
                    InkWell(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          "\$ ${product.price!} | Add to Cart",
                          style: TextStyle(color: Color(0xFF123650), fontSize: Dimensions.Font26 / 1.4),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Color(0xFFC1C4C7),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]
          );
      },)
    );
  }
}
