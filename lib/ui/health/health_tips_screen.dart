import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthTipsScreen extends StatelessWidget {
  const HealthTipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Health Tips',
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff184E68),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 20, end: 20, top: 20, bottom: 20),
                    width: double.infinity,
                    height: 270.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150.h,
                          child: Image.asset(
                            'assets/images/image_tips.jpeg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsetsDirectional.only(top: 11),
                          child: Text(
                            'Eat a healthy diet',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsetsDirectional.only(top: 11),
                          child: Text(
                            '              Lorem ipsum dolor sit amet, consectetur \n              adipiscing elit. Porta enim ultricies sem ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: 20),
          )
        ],
      ),
    );
  }
}
