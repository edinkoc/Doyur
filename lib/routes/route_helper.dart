import 'package:get/get.dart';
import 'package:myapp/pages/Tech/popular_tech_detail.dart';
import 'package:myapp/pages/Tech/recommended_tech_detail.dart';
import 'package:myapp/pages/home/home_page.dart';
import 'package:myapp/pages/home/main_tech_page.dart';
import 'package:myapp/pages/splash/splash_page.dart';

import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String splashPage = "/splash-page";

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';
  static String getCartPage()=>cartPage;
  static String getSplashPage() => '$splashPage';

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => HomePage()),
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularTechDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedTechDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: '/cartPage', // Assuming 'cartPage' is a string representing the route name
      page: () => CartPage(), // Assuming CartPage is the widget/page you want to show
      transition: Transition.fadeIn,
    ),
  ];
}
