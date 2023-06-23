import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          indicatorColor: const Color(0xff57CA85),
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsetsDirectional.only(bottom: 10),
          onTap: (int index) {
            setState(() {
              _tabController.index = index;
            });
            // ignore: avoid_print
            print('Selected tab index: $index');
          },
          tabs: const [
            Tab(text: 'Day'),
            Tab(text: 'Week'),
            Tab(text: 'Month'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                DayScreen(),
                WeekScreen(),
                MonthScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<ChartData> chartData = <ChartData>[
  ChartData(2010, 10.53, 5.3),
  ChartData(2011, 9.5, 5.4),
  ChartData(2012, 10, 2.65),
  ChartData(2013, 9.4, 2.62),
  ChartData(2014, 5.8, 10.99),
  ChartData(2015, 4.9, 1.44),
  ChartData(2016, 4.5, 2),
  ChartData(2017, 3.6, 1.56),
  ChartData(2018, 3.43, 5.1),
];

class ChartData {
  ChartData(this.x, this.y, this.y1);

  final int x;
  final double y;
  final double y1;
}

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("DAY"),
          CircularPercentIndicator(
            radius: 110.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 18.0,
            percent: 0.3,
            center: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  'Total steps \n 5,658',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: const Color(0xffCFD8DC),
            progressColor: const Color(0xff57CA85),
          ),

          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 6, start: 35, end: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.arrow_forward),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '146 kcal',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.arrow_forward),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '891 m',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.access_time_outlined),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '1:34h',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12, start: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: const Color(0xff57CA85),
                    minimumSize: const Size(50, 38),
                  ),
                  child: const Text(
                    'Running',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Walking',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Relax',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsetsDirectional.only(top: 20, start: 16),
            child: Text(
              'Total distance',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfCartesianChart(
                series: <ChartSeries>[
                  SplineAreaSeries<ChartData, int>(
                    color: const Color(0xff57CA85),
                    xValueMapper: (ChartData cData, _) => cData.x,
                    yValueMapper: (ChartData cData, _) => cData.y,
                    dataSource: chartData,
                  ),
                ],
              )),
          //Fintes
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            alignment: AlignmentDirectional.topStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fitness',
                  style: TextStyle(
                    color: const Color(0xff57CA85),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/FitnessWomenScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/fintes_women.jpg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Fitness For Women',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/FitnessMenScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/men.jpg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Fitness For Men',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Health Tips
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            alignment: AlignmentDirectional.topStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Health Tips',
                  style: TextStyle(
                    color: const Color(0xff57CA85),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/HealthTipsScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 20, bottom: 50),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/image_health_tips.jpeg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Health Tips',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Tips',
                    style: TextStyle(
                      color: const Color(0xff57CA85),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed("/HealthTipsScreen"),
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 22, end: 22, top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 200.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/image_health_tips.jpeg',
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'Health Tips',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //GEMET
          InkWell(
            onTap: () => Get.toNamed("/ClubScreen"),
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gemat',
                    style: TextStyle(
                      color: const Color(0xff57CA85),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed("/HealthTipsScreen"),
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 22, end: 22, top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 200.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/image_gmet.jpeg',
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'GMET',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

class WeekScreen extends StatelessWidget {
  const WeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("WEEK"),
          CircularPercentIndicator(
            radius: 110.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 18.0,
            percent: 0.3,
            center: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total steps \n 5,658',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: const Color(0xffCFD8DC),
            progressColor: const Color(0xff57CA85),
          ),

          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 6, start: 35, end: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.arrow_forward),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '146 kcal',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.arrow_forward),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '891 m',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.access_time_outlined),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '1:34h',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12, start: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: const Color(0xff57CA85),
                    minimumSize: const Size(50, 38),
                  ),
                  child: const Text(
                    'Running',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Walking',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Relax',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsetsDirectional.only(top: 20, start: 16),
            child: Text(
              'Total distance',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfCartesianChart(
                series: <ChartSeries>[
                  SplineAreaSeries<ChartData, int>(
                    color: const Color(0xff57CA85),
                    xValueMapper: (ChartData cData, _) => cData.x,
                    yValueMapper: (ChartData cData, _) => cData.y,
                    dataSource: chartData,
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            alignment: AlignmentDirectional.topStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fitness',
                  style: TextStyle(
                    color: const Color(0xff57CA85),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/FitnessWomenScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/fintes_women.jpg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Fitness For Women',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/FitnessMenScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/men.jpg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Fitness For Men',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Health Tips
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            alignment: AlignmentDirectional.topStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Health Tips',
                  style: TextStyle(
                    color: const Color(0xff57CA85),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/HealthTipsScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 20, bottom: 50),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/image_health_tips.jpeg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Health Tips',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Tips',
                    style: TextStyle(
                      color: const Color(0xff57CA85),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed("/HealthTipsScreen"),
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 22, end: 22, top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 200.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/image_health_tips.jpeg',
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'Health Tips',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //GEMET
          InkWell(
            onTap: () => Get.toNamed("/ClubScreen"),
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gemat',
                    style: TextStyle(
                      color: const Color(0xff57CA85),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed("/HealthTipsScreen"),
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 22, end: 22, top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 200.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/image_gmet.jpeg',
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'GMET',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

class MonthScreen extends StatelessWidget {
  const MonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("MONTH"),
          CircularPercentIndicator(
            radius: 110.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 18.0,
            percent: 0.3,
            center: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total steps \n 5,658',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: const Color(0xffCFD8DC),
            progressColor: const Color(0xff57CA85),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 6, start: 35, end: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.arrow_forward),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '146 kcal',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.arrow_forward),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '891 m',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 5.0,
                      percent: 0.6,
                      center: const Icon(Icons.access_time_outlined),
                      progressColor: const Color(0xff57CA85),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      '1:34h',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12, start: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: const Color(0xff57CA85),
                    minimumSize: const Size(50, 38),
                  ),
                  child: const Text(
                    'Running',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Walking',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Relax',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(top: 20, start: 16),
            child: Text(
              'Total distance',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfCartesianChart(
                series: <ChartSeries>[
                  SplineAreaSeries<ChartData, int>(
                    color: const Color(0xff57CA85),
                    xValueMapper: (ChartData cData, _) => cData.x,
                    yValueMapper: (ChartData cData, _) => cData.y,
                    dataSource: chartData,
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            alignment: AlignmentDirectional.topStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fitness',
                  style: TextStyle(
                    color: const Color(0xff57CA85),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/FitnessWomenScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/fintes_women.jpg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Fitness For Women',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed("/FitnessMenScreen"),
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/men.jpg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Fitness For Men',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Health Tips',
                    style: TextStyle(
                      color: const Color(0xff57CA85),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed("/HealthTipsScreen"),
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 22, end: 22, top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 200.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/image_health_tips.jpeg',
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'Health Tips',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed("/ClubScreen"),
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gemat',
                    style: TextStyle(
                      color: const Color(0xff57CA85),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed("/HealthTipsScreen"),
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 22, end: 22, top: 20, bottom: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      height: 200.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/image_gmet.jpeg',
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              'GMET',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
