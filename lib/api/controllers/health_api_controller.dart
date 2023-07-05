import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../api/api_settings.dart';
import '../../common/models/models.dart';
import '../../common/store/store.dart';
import '../../common/utils/utils.dart';

class HealthApiController with Helpers {
  Future<List<Health>> getHealth() async {
    var url = Uri.parse(ApiSettings.HEALTH);
    final token = UserStore.to.token;
    var response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponseBody = jsonDecode(response.body);
      var healthJsonArray = jsonResponseBody['message'] as List;
      List<Health> health = healthJsonArray
          .map((healthJsonObject) => Health.fromJson(healthJsonObject))
          .toList();

      return health;
    } else if (response.statusCode != 500) {
    } else {}
    return [];
  }
}
