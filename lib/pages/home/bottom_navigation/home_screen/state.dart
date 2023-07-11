import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/models/models.dart';
import '../../../../common/store/store.dart';

class HomeState {
  final email = UserStore.to.profile.email;
  final db = FirebaseFirestore.instance;

  var checkGender = Gender.non.obs;
  RxString gender = ''.obs;

  late TabController tabController;
}
