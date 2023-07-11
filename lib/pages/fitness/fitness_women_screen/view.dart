import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/models/models.dart';
import '../../../common/values/values.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

// ignore: must_be_immutable
class FitnessWomenScreen extends GetView<FitnessWomenController> {
  FitnessWomenScreen({Key? key}) : super(key: key);

  @override
  FitnessWomenController controller = Get.put(FitnessWomenController());


  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "Fitness For Women",
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
      return FutureBuilder<List<Video>?>(
        future: controller.state.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            controller.state.video = snapshot.data!;
            return ListView.separated(
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
                                  controller.state.video[index].youtube,
                                )!,
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
                              arguments: controller.state.video[index].youtube,
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
              itemCount: controller.state.video.length,
            );
          } else {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.grey,
                    size: 50,
                  ),
                  Text(
                    'No DATA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
