import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lets_graduation/api/api_settings.dart';
import 'package:lets_graduation/common/utils/helpers.dart';

import '../../common/models/models.dart';

class RegisterApiController with Helpers {
  Future<bool> register(
      {required BuildContext context, required UserData userData}) async {
    var url = Uri.parse(ApiSettings.REGISTER);
    var response = await http.post(
      url,
      body: {
        'name': userData.name,
        'username': userData.name,
        'email': userData.email,
        'password': userData.password,
        'photo': userData.photourl,
        'gender': userData.gender,
        'fcm_token': userData.fcmtoken,
      },
    );

    if (response.statusCode == 201) {
      showSnackBar(message: 'Account created successfully');
      return true;
    } else if (response.statusCode != 500) {
      showSnackBar(message: 'Cannot Register');
    } else {
      showSnackBar(
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }
}
