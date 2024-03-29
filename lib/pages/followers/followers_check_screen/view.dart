import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';

class FollowesCheckScreen extends StatelessWidget {
  const FollowesCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Frindes',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            print('ff');
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff184E68),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20, start: 22),
              child: TextField(
                keyboardType: TextInputType.name,
                onTap: () {},
                onChanged: (String value) {},
                cursorColor: Colors.black,
                cursorRadius: const Radius.circular(10),
                enabled: true,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black),
                decoration: InputDecoration(
                  fillColor: const Color(0xffF0F0F0),
                  filled: true,
                  helperMaxLines: 1,
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Color(0xffA1A1A1),
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffF5F5F5), width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff363737), width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  prefixIcon: const Icon(Icons.search_outlined),
                  suffixIcon: const Icon(Icons.person_search_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Frindes',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offAndToNamed(AppRoutes.FollowersRemove);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xff57CA85),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ListTile(
                        leading: Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5FA),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.offAndToNamed(AppRoutes.FollowersRemove);
                              print('gg');
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffF5F5FA),
                              child: Image.asset(
                                  'assets/images/personal_frindes.png'),
                            ),
                          ),
                        ),
                        title: const Text(
                          'Will Knowles',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2B2B2B),
                          ),
                        ),
                        trailing: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            border:
                                Border.all(color: const Color(0xffD9D9D9), width: 1),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Color(0xffECEEF1),
                      thickness: 1,
                    );
                  },
                  itemCount: 40),
            )
          ],
        ),
      ),
    );
  }
}
