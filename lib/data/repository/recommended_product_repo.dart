import 'package:get/get.dart';
import 'package:myapp/data/api/api_client.dart';
import 'package:myapp/helper/dependencies.dart';

import '../../app_constants.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData("/api/v1/products/recommended");
  }
}