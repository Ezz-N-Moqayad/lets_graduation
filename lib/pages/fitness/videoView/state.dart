import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoViewState {
  final videoURL = Get.arguments;

  late YoutubePlayerController youtubePlayerController;
  RxBool isAppBarVisible = true.obs;
}
