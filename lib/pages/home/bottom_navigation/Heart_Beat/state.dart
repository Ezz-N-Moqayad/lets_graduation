import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../common/store/store.dart';

class HeartBeatState {
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  RxInt bmiLower = 0.obs;
  RxInt bmiUpper = 0.obs;
}
