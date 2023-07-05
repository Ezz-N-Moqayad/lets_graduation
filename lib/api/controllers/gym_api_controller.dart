import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../api/api_settings.dart';
import '../../common/models/models.dart';
import '../../common/store/store.dart';
import '../../common/utils/utils.dart';

class GymApiController with Helpers {
  Future<List<Gym>> getGyms() async {
    var url = Uri.parse(ApiSettings.GYM);
    final token = UserStore.to.token;
    var response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponseBody = jsonDecode(response.body);
      var gymJsonArray = jsonResponseBody['message'] as List;
      List<Gym> gym = gymJsonArray
          .map((gymJsonObject) => Gym.fromJson(gymJsonObject))
          .toList();

      return gym;
    } else if (response.statusCode != 500) {
    } else {}
    return [];
  }
}
