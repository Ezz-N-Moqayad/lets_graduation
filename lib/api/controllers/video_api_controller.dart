import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../api/api_settings.dart';
import '../../common/models/models.dart';
import '../../common/store/store.dart';
import '../../common/utils/utils.dart';

class VideoApiController with Helpers {
  Future<List<Video>?> getMaleVideos() async {
    var url = Uri.parse(ApiSettings.MALE_VIDEO);
    final token = UserStore.to.token;
    var response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponseBody = jsonDecode(response.body);
      var videoJsonArray = jsonResponseBody['message'] as List;
      List<Video> video = videoJsonArray
          .map((videoJsonObject) => Video.fromJson(videoJsonObject))
          .toList();

      return video;
    } else if (response.statusCode != 500) {
    } else {}
    return [];
  }

  Future<List<Video>?> getFemaleVideos() async {
    var url = Uri.parse(ApiSettings.FEMALE_VIDEO);
    final token = UserStore.to.token;
    var response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponseBody = jsonDecode(response.body);
      var videoJsonArray = jsonResponseBody['message'] as List;
      List<Video> video = videoJsonArray
          .map((videoJsonObject) => Video.fromJson(videoJsonObject))
          .toList();

      return video;
    } else if (response.statusCode != 500) {
    } else {}
    return [];
  }
}
