import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/dimensions.dart';
import 'package:myapp/pages/auth/sign_up_page.dart';
import 'package:myapp/routes/route_helper.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadRecourse() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList(); // Corrected line with parentheses
  }

  @override
  void initState() {
    super.initState();
    _loadRecourse();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    Timer(
      const Duration(seconds: 3),
          () {
        Get.to(SignUpPage());
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
              child: Center(child: Image.asset("assets/image/png011.png", width: Dimensions.splashImage,))),
              Center(child: Image.asset("assets/image/galaxy-20201215-133936.png", width: Dimensions.splashImage / 2,)),
        ],
      ),
    );
  }
}
