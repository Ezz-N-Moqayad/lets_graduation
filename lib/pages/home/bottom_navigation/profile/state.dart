import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../common/store/store.dart';

class ProfileState {
  final db = FirebaseFirestore.instance;

  final emailFire = UserStore.to.profile.email;

  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString photoUrl = ''.obs;
}
