import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/routes/routes.dart';
import 'widgets/widget_container_page_view.dart';
import 'widgets/widget_pageView.dart';
import 'index.dart';

class ScreenPageView extends GetView<ScreenPageController> {
  const ScreenPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: PageView(
              controller: PageController(
                initialPage: 0,
                keepPage: false,
                viewportFraction: 1,
              ),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                controller.changePage(index);
              },
              children: [
                widget_pageView(
                  title: controller.state.title,
                  Imagee: 'assets/images/page_view.png',
                ),
                widget_pageView(
                  title: controller.state.title,
                  Imagee: 'assets/images/page_view.png',
                ),
                widget_pageView(
                  title: controller.state.title,
                  Imagee: 'assets/images/page_view.png',
                ),
              ],
            ),
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 40, end: 40, top: 700),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAndToNamed(AppRoutes.login);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xff388D77),
                  minimumSize: const Size(289, 48),
                ),
                child: const Text(
                  'Join our community',
                  style: TextStyle(
                    color: Color(0xffFCFCFC),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsetsDirectional.only(top: 300, start: 117),
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Row(
                  children: [
                    widget_container_page_view(
                      title: '1',
                      selected: controller.state.index.value == 0,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5.0),
                      child: Container(
                        width: 20,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            width: 1.5,
                            color: const Color(0xffF7F7F8),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5.0),
                      child: widget_container_page_view(
                        title: '2',
                        selected: controller.state.index.value == 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5.0),
                      child: Container(
                        width: 20,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            width: 1.5,
                            color: const Color(0xffF7F7F8),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5.0),
                      child: widget_container_page_view(
                        title: '3',
                        selected: controller.state.index.value == 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
