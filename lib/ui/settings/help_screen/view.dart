import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.topStart,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
              Color(0xff184E68),
              Color(0xff57CA85),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 23,
                      )),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    'kkkkkkk',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: Text(
                'About the app ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: Text(
                'kkkkkkkkkkkkkk',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: Text(
                'Our mission',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22),
              child: Text(
                'hhhhhhh',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
