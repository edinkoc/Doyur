import 'package:get/get.dart';
import 'package:myapp/data/api/api_client.dart';
import 'package:myapp/helper/dependencies.dart';

import '../../app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("/api/v1/products/popular");
  }
}