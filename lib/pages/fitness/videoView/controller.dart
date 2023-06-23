import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'index.dart';

class VideoViewController extends GetxController {
  final state = VideoViewState();

  VideoViewController();

  @override
  void onInit() {
    super.onInit();

    final videoID = YoutubePlayer.convertUrlToId(state.videoURL);
    state.youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        isLive: false,
        loop: false,
      ),
    );

    updateAppBarVisibility();
  }

  void updateAppBarVisibility() {
    final orientation = MediaQuery.of(Get.context!).orientation;
    state.isAppBarVisible.value = orientation == Orientation.portrait;
  }
}
