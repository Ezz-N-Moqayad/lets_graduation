import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
            print('Selected tab index: $index');
          },
          tabs: const [
            Tab(
              text: 'Day'
            ),
            Tab(
              text: 'Week'
            ),
            Tab(
              text: 'Month'
            ),
          ],
        ),
      ),
      body: const IndexedStack(
        children: [
          // TabBarView(
          //   controller: _tabController,
          //   children: [
          //     Login(),
          //     Singin(),
          //
          //   ],
          // ),

          IndexedStack(
            children: [
              // HomeScreen(),
              // HomeScreen(),
              // HomeScreen(),
            ],
          ),
        ],
      ),
    );
  }
}
