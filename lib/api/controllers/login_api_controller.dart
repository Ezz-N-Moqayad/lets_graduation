import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../api/api_settings.dart';
import '../../common/models/models.dart';
import '../../common/utils/utils.dart';

class LoginApiController with Helpers {
  Future<String?> login(
      {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.LOGIN);

    var response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      var jsonObiect = jsonDecode(response.body);
      BaseResponse baseResponse = BaseResponse.fromJson(jsonObiect);
      return baseResponse.message;
    } else if (response.statusCode != 500) {
      showSnackBar(message: 'Cannot Login');
    } else {
      showSnackBar(
          message: 'Something went wrong, please try again!', error: true);
    }
    return null;
  }
}
