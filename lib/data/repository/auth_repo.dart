import 'package:get/get_connect/http/src/response/response.dart';
import 'package:myapp/app_constants.dart';
import 'package:myapp/data/api/api_client.dart';
import 'package:myapp/models/sign_up_body_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.sharedPreferences, required this.apiClient
});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}