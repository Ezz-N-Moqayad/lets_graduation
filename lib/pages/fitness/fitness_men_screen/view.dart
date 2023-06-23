import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/values/values.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

// ignore: must_be_immutable
class FitnessMenScreen extends GetView<FitnessMenController> {
  FitnessMenScreen({Key? key}) : super(key: key);

  FitnessMenController controllers = Get.put(FitnessMenController());

  var videosURL = <String>[
    'https://www.youtube.com/watch?v=fRtM8pI4hmA',
    'https://www.youtube.com/watch?v=aodKQH_7Bi8',
    'https://www.youtube.com/watch?v=KRa1r0bmidA',
    'https://www.youtube.com/watch?v=MEp_onD3610',
    'https://www.youtube.com/watch?v=nULQccFpYPI',
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "Fitness",
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 22, end: 22, top: 12),
                  width: double.infinity,
                  height: 200.h,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    videosURL[index].toString())!,
                                flags: const YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                  enableCaption: true,
                                  isLive: false,
                                  loop: false,
                                ),
                              ),
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
                          InkWell(
                            onTap: () => Get.toNamed(
                              "/VideoViewScreen",
                              arguments: videosURL[index].toString(),
                            ),
                            child:
                                SizedBox(width: double.infinity, height: 200.h),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 0);
              },
              itemCount: 5,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
