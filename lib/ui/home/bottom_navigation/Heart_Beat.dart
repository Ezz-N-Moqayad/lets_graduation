import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HeartBeat extends StatefulWidget {
  const HeartBeat({Key? key}) : super(key: key);

  @override
  State<HeartBeat> createState() => _HeartBeatState();
}

class _HeartBeatState extends State<HeartBeat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 90,
        // title: Text(
        //   'HeartBeat',
        //   style: TextStyle(
        //     fontWeight: FontWeight.w400,
        //     fontSize: 20,
        //     color: Color(0xff184E68),
        //   ),
        // ),
        title: GradientText(
          'HeartBeat',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          gradientType: GradientType.linear,
          gradientDirection: GradientDirection.ttb,
          colors: [
            Color(0xff184E68),
            Color(0xff57CA85),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Stack(
              children: [
                // Image.asset('${Const.images}c',width:
                // 282,),
                Image.asset(
                  'assets/images/heartbeat.png',
                  width: 282,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 100, start: 110),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 40),
                        child: Text(
                          'BPM',
                          style: TextStyle(
                            color: Color(0xff57CA85),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '110',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'AVG',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 46,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 42),
                        child: Text(
                          'BPM',
                          style: TextStyle(
                            color: Color(0xff57CA85),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 12),
                        child: Text(
                          '79',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 15),
                        child: Text(
                          'AVG',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 42),
                        child: Text(
                          'BPM',
                          style: TextStyle(
                            color: Color(0xff57CA85),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 12),
                        child: Text(
                          '63',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 15),
                        child: Text(
                          'MIN',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 42),
                        child: Text(
                          'BPM',
                          style: TextStyle(
                            color: Color(0xff57CA85),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 12),
                        child: Text(
                          '112',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 15),
                        child: Text(
                          'MAX',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75,
            ),
            InkWell(
                onTap: () {},
                child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Icon(
                      Icons.fingerprint_outlined,
                      color: Color(0xff57CA85),
                      size: 60,
                    )))
          ],
        ),
      ),
    );
  }
}

//
// Column(
// children: [
// Text('BPM',style: TextStyle(
// color: Color(0xff57CA85),
// fontWeight: FontWeight.w700,
// fontSize: 12,
// ),),
// Text('79',style: TextStyle(
// color: Colors.grey,
// fontWeight: FontWeight.w700,
// fontSize: 20,
// ),),
// Text('AVG',style: TextStyle(
// color: Colors.grey,
// fontWeight: FontWeight.w700,
// fontSize: 20,
// ),),
//
// ],
// ),
