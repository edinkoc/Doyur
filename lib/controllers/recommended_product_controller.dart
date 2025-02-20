import 'package:get/get.dart';
import 'package:myapp/data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    print("getRecommendedProductList method called.");
    try {
      Response response = await recommendedProductRepo.getRecommendedProductList();
      if (response.statusCode == 200) {
        print("got products recommended");
        Map<String, dynamic> responseData = response.body;
        List<dynamic> productsData = responseData['products'];
        _recommendedProductList = productsData
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
        print(_recommendedProductList);
        _isLoaded = true;
        update();
      } else {
        print("Failed to get products. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}
