import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/routes/routes.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Card(
              margin: EdgeInsetsDirectional.only(start: 5, end: 5),
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              )),
              child: SizedBox(
                width: double.infinity,
                height: 89,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Groups',
                        style: TextStyle(
                          color: Color(0xff184E68),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.offAndToNamed(AppRoutes.FollowersRemove);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding:
                      EdgeInsetsDirectional.only(start: 16, end: 16, top: 20),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            color: Color(0xffF5F5FA),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: InkWell(
                            onTap: () {
                              print('gg');
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xffF5F5FA),
                              child:
                                  Image.asset('assets/images/image_groups.png'),
                            ),
                          ),
                        ),
                        horizontalTitleGap: 16,
                        title: Text(
                          'Will Knowles',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2B2B2B),
                          ),
                        ),
                        subtitle: Text(
                          'Total Steps: 1000',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Color(0xffECEEF1),
                      thickness: 1,
                    );
                  },
                  itemCount: 40),
            ),
          ],
        ),
      ),
    );
  }
}
