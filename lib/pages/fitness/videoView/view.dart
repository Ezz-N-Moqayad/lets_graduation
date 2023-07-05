import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import 'index.dart';

// ignore: must_be_immutable
class VideoViewScreen extends GetView<VideoViewController> {
  VideoViewScreen({Key? key}) : super(key: key);

  @override
  VideoViewController controller = Get.put(VideoViewController());

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "Video View",
          style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    // ignore: no_leading_underscores_for_local_identifiers
    Widget _buildBody() {
      return Container(
        color: Colors.black45,
        child: Center(
          child: YoutubePlayer(
            controller: controller.state.youtubePlayerController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            onReady: () => debugPrint('Ready'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Color(0xff195d31),
                  handleColor: Color(0xff57CA85),
                ),
              ),
              const PlaybackSpeedButton(),
              FullScreenButton(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
