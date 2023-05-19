import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../widget/widget_container_page_view.dart';
import '../../widget/widget_pageView.dart';

class ScreenPageView extends StatefulWidget {
  const ScreenPageView({Key? key}) : super(key: key);

  @override
  State<ScreenPageView> createState() => _ScreenPageViewState();
}

class _ScreenPageViewState extends State<ScreenPageView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                widget_pageView(
                  title:
                      'Want a walking group? Walk friends! It is a  \n community of thousands of members that \n connects girls to create walking groups',
                  Imagee: 'assets/images/page_view.png',
                ),
                widget_pageView(
                  title:
                      'Want a walking group? Walk friends! It is a  \n community of thousands of members that \n connects girls to create walking groups',
                  Imagee: 'assets/images/page_view.png',
                ),
                widget_pageView(
                  title:
                      'Want a walking group? Walk friends! It is a  \n community of thousands of members that \n connects girls to create walking groups',
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
                child: Text(
                  'Join our community',
                  style: TextStyle(
                    color: Color(0xffFCFCFC),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(289, 48),
                  primary: Color(0xff388D77),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 300, start: 117),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Row(
                children: [
                  widget_container_page_view(
                    title: '1',
                    selected: _currentPage == 0,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 20,
                    height: 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                          width: 1.5,
                          color: Color(0xffF7F7F8),
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  widget_container_page_view(
                    title: '2',
                    selected: _currentPage == 1,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 20,
                    height: 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                          width: 1.5,
                          color: Color(0xffF7F7F8),
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  widget_container_page_view(
                    title: '3',
                    selected: _currentPage == 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
