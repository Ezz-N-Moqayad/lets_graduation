import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../common/store/store.dart';

class ProfileState {
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  RxString name = "".obs;
  RxString email = "".obs;
  RxString photoUrl = "".obs;
}
