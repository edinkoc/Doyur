import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myapp/app_constants.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/controllers/popular_product_controller.dart';
import 'package:myapp/controllers/recommended_product_controller.dart';
import 'package:myapp/dimensions.dart';
import 'package:myapp/helper/dependencies.dart';
import 'package:myapp/models/products_model.dart';
import 'package:myapp/pages/Tech/popular_tech_detail.dart';
import 'package:myapp/routes/route_helper.dart';
import 'package:myapp/widgets/Icon_text_widget.dart';
import 'package:myapp/widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class TechPPageBody extends StatefulWidget {
  // Constructor for TechPPageBody widget
  const TechPPageBody({Key? key}) : super(key: key);

  // Create the state for the TechPPageBody widget
  @override
  State<TechPPageBody> createState() => _TechPPageBodyState();
}

class _TechPPageBodyState extends State<TechPPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageVal = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.PageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageVal = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Build the widget
  @override
  Widget build(BuildContext context) {
    // Outer container for the TechPPageBody widget
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded ? Container(
              height: Dimensions.PageView,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(
                        position, popularProducts.popularProductList[position]);
                  },
                ),
            ) : CircularProgressIndicator(
              color: Color(0xFF0C2F60),
            );
          },
        ),
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
              position: _currPageVal,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          },
        ),
        SizedBox(height: Dimensions.Height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SmallText(text: "Popular Dishes", color: Color(0xFF123650), size: Dimensions.Font16,),
              SizedBox(width: Dimensions.width10,),
              Icon(Icons.local_fire_department, color: Color(0xFFF32121)),
            ],
          ),
        ),
        // recommended food
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded ? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProduct.recommendedProductList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getRecommendedFood(index));
                },
                child: Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, bottom: Dimensions.Height10),
                  child: Row(
                    children: [
                      // image section
                      Container(
                        width: Dimensions.ListViewImageSize,
                        height: Dimensions.ListViewTestContainer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(right: Radius.circular(10), left: Radius.circular(10),),
                          color: MyColors.customColor4,
                          image: DecorationImage(
                            image: NetworkImage(
                                AppConstants.BASE_URL + "/uploads/" + recommendedProduct.recommendedProductList[index].img!
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // text container
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Color(0xFFC7C5C5),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10 / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(color: Color(0xFF123650), text: recommendedProduct.recommendedProductList[index].name!, size: 16,),
                                  SizedBox(height: Dimensions.Height10,),
                                  SmallText(color: Color(0xFF123650), text: "With wonderful seasoning from China", size: 12,),
                                  SizedBox(height: Dimensions.Height10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconText(icon: Icons.place, text: '2.4 km', color: Color(0xFF123650), IconColor: Color(0xFF322646), size: 1,),
                                      SizedBox(width: 15,),
                                      IconText(icon: Icons.access_time_filled, text: '45 min', color: Color(0xFF123650), IconColor: Color(0xFFF35921), size: 1,),
                                      SizedBox(width: 15,),
                                      IconText(icon: Icons.circle, text: 'Available', color: Color(0xFF123650), IconColor: Color(0xFF146024), size: 1,),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ) : CircularProgressIndicator(
            color: Color(0xFF0C2F60),
          );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageVal.floor()) {
      var currScale = 1 - (_currPageVal - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPageVal.floor() + 1) {
      var currScale = _scaleFactor + (_currPageVal - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPageVal.floor() - 1) {
      var currScale = 1 - (_currPageVal - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor), 1);
    }

    // Use Stack widget to overlay two containers
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // Container to display the main content
          GestureDetector(
          onTap: (){
            Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.PageViewContainer,
              margin: EdgeInsets.only(left: 3, right: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xEAF5955B) : Color(0xFFF37121),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL + "/uploads/" + popularProduct.img!
                  )
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.PageViewTextContainer,
              margin: EdgeInsets.only(left: 34, right: 34, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFA6A4A4),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Color(0xFFFFFFFF),
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Color(0xFFFFFFFF),
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.Height15, left: 15, right: 15),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
