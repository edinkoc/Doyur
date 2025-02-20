import 'package:get/get.dart';
import 'package:myapp/data/repository/auth_repo.dart';
import 'package:myapp/models/response_model.dart';
import 'package:myapp/models/sign_up_body_model.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo
});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(response.body["token"], true); // Set _isSuccess to true
    } else {
      responseModel = ResponseModel(response.statusText!, false); // Set _isSuccess to false
    }

    _isLoading = false; // Fix this line to set _isLoading to false
    update();

    return responseModel;
  }
}

